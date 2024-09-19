---@class xmake.Runners
local M = {}

local Config = require("xmake.config")
local Utils = require("xmake.utils")

---@param str string
local function clean_ASCI_color(str)
	if not str then return "" end
	return str:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
end

local get_tmp_dir = function()
	return vim.fn.stdpath("data") .. "/xmake-tmp"
end

---@class xmake.Runner
---@field run fun(self: self, cmd: string[], opts: vim.SystemOpts, on_exit?: fun(out: vim.SystemCompleted))
---@field show fun(self: self): nil
---@field close fun(): nil

---@class xmake.SystemOpts: vim.SystemOpts
---@field args string[]

local runners = {}

---@class xmake.Runner.QuickFix: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(out: vim.SystemCompleted))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.quickfix = {
	---@type xmake.Config.QuickFix
	config = nil,

	_append_to_quickfix = function(self, data)
		local lines = vim.iter(vim.split(data, "\n"))
			:filter(function(str)
				return #str ~= 0
			end)
			:totable()

		vim.fn.setqflist({}, "a", { lines = lines })
		if self:_check_scroll() then vim.api.nvim_command("cbottom") end
	end,

	_check_scroll = function()
		if vim.bo.buftype == "quickfix" then
			local current_buf = vim.api.nvim_win_get_buf(0)
			local cursor_pos = vim.api.nvim_win_get_cursor(0)
			local line_count = vim.api.nvim_buf_line_count(current_buf)
			return cursor_pos[1] == line_count - 1
		end
		return true
	end,

	_handle_output = function(self, output_type, opts)
		return vim.schedule_wrap(function(err, data)
			err = clean_ASCI_color(err)
			data = clean_ASCI_color(data)
			if opts[output_type] then opts[output_type](err, data) end
			self:_append_to_quickfix(data)
		end)
	end,

	run = function(self, cmd, opts, on_exit)
		opts = opts or {}
		local _opts = vim.tbl_deep_extend("force", {
			stdout = self:_handle_output("stdout", opts),
			stderr = self:_handle_output("stderr", opts),
			text = true,
		}, opts)

		local _on_exit = vim.schedule_wrap(function(out)
			if on_exit then on_exit(out) end

			if out.code == 0 then
				if self.config.close_on_success then self:close() end
				return
			end
			if out.code ~= 0 then
				if self.config.show ~= "only_on_error" then return end
				self:show()
				vim.api.nvim_command("cbottom")
			end
		end)

		vim.fn.setqflist({}, " ", { title = table.concat(cmd, " ") })

		if self.config.show == "always" then self:show() end

		vim.system(cmd, _opts, _on_exit)
	end,

	show = function(self)
		vim.api.nvim_command(self.config.position .. " copen " .. self.config.size)
		vim.api.nvim_command("wincmd p")
	end,

	close = function()
		vim.api.nvim_command("cclose")
	end,
}

---@class xmake.Runner.Toggleterm: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(out))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.toggleterm = {
	---@type xmake.Config.Toggleterm
	config = nil,

	state = {
		---@type any
		ins_term = nil,
	},

	run = function(self, cmd, opts, on_exit)
		opts = opts or {}
		local has_tg, tg = pcall(require, "toggleterm.terminal")
		if not has_tg then return end

		if self.config.singleton and self.state.ins_term then self.state.ins_term:close() end
		self.state.ins_term = tg.Terminal:new({
			cmd = table.concat(cmd, " "),
			dir = opts.cwd,
			direction = self.config.direction,
			auto_scroll = self.config.auto_scroll,
			close_on_exit = false,
			on_stdout = function(_, _, data, _)
				if opts.stdout then opts.stdout(nil, data) end
			end,
			on_stderr = function(_, _, data, _)
				if opts.stderr then opts.stderr(nil, data) end
			end,
			on_exit = function(_, _, exit_code, _)
				if on_exit then on_exit(exit_code) end
			end,
		})
		self.state.ins_term:toggle()
	end,
	show = function(self)
		self.state.ins_term:open()
	end,
	close = function(self)
		self.state.ins_term:close()
	end,
}

---@class xmake.Runner.Terminal
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(out))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.terminal = {
	---@type xmake.Config.Terminal
	config = nil,

	state = {
		id = nil,
		old_id = nil,
		on_exit_coroutine = nil,
	},

	_get_buffers_with_prefix = function(self)
		local buffers = vim.api.nvim_list_bufs()
		local filtered_buffers = {}

		for _, buffer in ipairs(buffers) do
			local name = vim.api.nvim_buf_get_name(buffer)
			local basename = vim.fn.fnamemodify(name, ":t")
			if basename:sub(1, #self.config.prefix_name) == self.config.prefix_name then
				table.insert(filtered_buffers, buffer)
			end
		end

		return filtered_buffers
	end,

	_create_or_get_terminal = function(self)
		local term_idx = nil
		local term_name = self.config.prefix_name .. self.config.name

		for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
			if buf_name == term_name then
				term_idx = bufnr
				break
			end
		end

		if term_idx ~= nil and vim.api.nvim_buf_is_valid(term_idx) then
			local buf_type = vim.api.nvim_get_option_value("buftype", { buf = term_idx })
			if buf_type == "terminal" then
				return true, term_idx
			else
				vim.api.nvim_buf_delete(term_idx, { force = true })
			end
		end

		local buffers_before = vim.api.nvim_list_bufs()

		vim.cmd(":" .. self.config.split_direction .. " " .. self.config.split_size .. "sp | :term")
		vim.api.nvim_buf_set_name(vim.api.nvim_get_current_buf(), term_name)
		vim.cmd(":setlocal laststatus=3")

		local new_buffers = vim.api.nvim_list_bufs()
		local diff_buffers_list = vim.iter(new_buffers)
			:filter(function(buf)
				return not vim.tbl_contains(buffers_before, buf)
			end)
			:totable()

		for _, buffer in ipairs(diff_buffers_list) do
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buffer), ":t")
			if name ~= term_name then vim.cmd(":bw! " .. buffer) end
		end

		vim.bo[vim.api.nvim_get_current_buf()].filetype = "xmake_terminal"

		local buffers = vim.api.nvim_list_bufs()
		for _, buffer in ipairs(buffers) do
			local name = vim.api.nvim_buf_get_name(buffer)
			if string.match(name, "^scratch_") then vim.api.nvim_buf_delete(buffer, { force = true }) end
		end

		for _, bufnr in ipairs(buffers) do
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
			if name == term_name then return false, bufnr end
		end

		return false, nil
	end,

	_reposition = function(self)
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			local bufname = vim.api.nvim_buf_get_name(buf)
			if bufname:match(self.config.prefix_name) then vim.api.nvim_win_close(win, false) end
		end

		local current_tab_wins = vim.api.nvim_tabpage_list_wins(0)
		local buflist = {}
		for _, win in ipairs(current_tab_wins) do
			local buf = vim.api.nvim_win_get_buf(win)
			local bufname = vim.api.nvim_buf_get_name(buf)
			if bufname:match(self.config.prefix_name) then table.insert(buflist, win) end
		end

		if next(buflist) then
			for i = 1, #buflist do
				if i > 1 then vim.api.nvim_win_close(buflist[i], false) end
			end
			return buflist[1]
		end

		return -1
	end,

	run = function(self, cmd, opts, on_exit)
		vim.fn.mkdir(get_tmp_dir(), "p")
		local tmp_file = io.open(get_tmp_dir() .. "/.runner_terminal.lock", "w")
		if tmp_file then tmp_file:close() end

		local terminal_already_exists, buffer_idx = self:_create_or_get_terminal()
		self.state.id = buffer_idx

		local final_win_id = self:_reposition()

		if not terminal_already_exists or self.state.old_id ~= self.state.id then
			self.state.old_id = self.state.id
			self:_send_data_to_terminal(buffer_idx, opts.env)
		end

		self:_send_data_to_terminal(buffer_idx, opts.env)
		self.state.on_exit_coroutine = coroutine.create(function()
			while self:_check_local_file() do
				vim.defer_fn(function()
					coroutine.resume(self.state.on_exit_coroutine)
				end, 25)
				coroutine.yield()
			end
			if on_exit then on_exit() end
		end)
		coroutine.resume(self.state.on_exit_coroutine)
	end,
}

local function create_runner_metatable(type, name)
	return setmetatable({}, {
		__call = function(_, ...)
			runners[name].config = Config[type].config[name]
			return runners[name].run(runners[name], ...)
		end,
		__index = function(_, key)
			return runners[name][key]
		end,
	})
end

---@class xmake.Runners.Runner: xmake.Runner
M.run = create_runner_metatable("runner", Config.runner.type)

---@class xmake.Runners.Execute: xmake.Runner
M.exe = create_runner_metatable("execute", Config.execute.type)

return M
