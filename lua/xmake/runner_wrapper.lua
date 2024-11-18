---@class xmake.Runners
local M = {}

local Utils = require("xmake.utils")
local Config = require("xmake.config")

---@param str string
local function clean_ASCI_color(str)
	if not str then return "" end
	return str:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
end

local get_tmp_dir = function()
	return vim.fn.stdpath("data") .. "/xmake-tmp"
end

---@class xmake.Runner
---@field run fun(self: self, cmd: string[], opts: vim.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(): nil

---@class xmake.SystemOpts: vim.SystemOpts
---@field args string[]

local runners = {}

---@class xmake.Runner.QuickFix: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.quickfix = {
	---@type xmake.Config.QuickFix
	config = nil,

	_append_to_quickfix = function(self, data)
		local lines = vim.iter(vim.split(data, "\n"))
			:filter(function(lien)
				return #lien ~= 0
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
			if on_exit then on_exit(out.code) end

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
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
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

				if exit_code == 0 then
					if self.config.close_on_success then self:close() end
				end
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
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.terminal = {
	---@type xmake.Config.Terminal
	config = nil,

	state = {
		id = nil,
		old_id = nil,
		on_exit_coroutine = nil,
		tmp_lock_file_name = get_tmp_dir() .. "/.terminal.lock",
		tmp_exit_code_file_name = get_tmp_dir() .. "/.exit_code",
	},

	_create_or_get_terminal = function(self)
		local term_idx
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

		return false, -1
	end,

	_reposition = function(self)
		local buflist = {}
		for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
			for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
				local buf = vim.api.nvim_win_get_buf(win)
				local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")

				if bufname:sub(1, #self.config.prefix_name) == self.config.prefix_name then
					if vim.api.nvim_get_current_tabpage() ~= tabpage then
						vim.api.nvim_win_close(win, false)
					else
						table.insert(buflist, win)
					end
				end
			end
		end

		if next(buflist) then
			for i = 1, #buflist do
				if i > 1 then vim.api.nvim_win_close(buflist[i], false) end
			end
			return buflist[1] --[[ @as integer ]]
		end

		return -1
	end,

	---@param self xmake.Runner.Terminal
	---@param ids { buffer_idx: integer, win_id: integer }
	---@param cmd string[]|table<string, string>
	_send_data_to_terminal = function(self, ids, cmd)
		if ids.win_id ~= -1 then
			vim.api.nvim_win_set_buf(ids.win_id, ids.buffer_idx)
			if self.config.auto_resize then
				if self.config.split_direction == "horizontal" then
					vim.api.nvim_win_set_height(ids.win_id, self.config.split_size)
				else
					vim.api.nvim_win_set_width(ids.win_id, self.config.split_size)
				end
			end
		elseif ids.win_id >= -1 then
			vim.cmd(":" .. self.config.split_direction .. " " .. self.config.split_size .. "sp")
			vim.api.nvim_win_set_buf(0, ids.buffer_idx)
		end

		if self.config.focus then
			vim.api.nvim_set_current_win(ids.win_id)
			if self.config.focus_auto_insert then vim.cmd("startinsert") end
		else
			local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(0))
			local basename = vim.fn.fnamemodify(name, ":t")
			if basename:sub(1, #self.config.prefix_name) == self.config.prefix_name then
				if not self.config.focus then vim.cmd("wincmd p") end
			end
		end

		vim.api.nvim_buf_call(ids.buffer_idx, function()
			if vim.bo[ids.buffer_idx].buftype == "terminal" then vim.cmd("normal! G") end
		end)

		-- TODO: 当前代码只能在 zsh, bash, sh 环境下工作
		local full_cmd
		if vim.islist(cmd) then
			table.insert(
				cmd,
				("; echo $? > %s && \\rm %s"):format(self.state.tmp_exit_code_file_name, self.state.tmp_lock_file_name)
			)
			full_cmd = table.concat(cmd, " ") .. "\n"
		else
			if vim.tbl_isempty(cmd or {}) then
				full_cmd = ""
			else
				for k, v in pairs(cmd) do
					full_cmd = full_cmd .. " " .. k .. "=" .. v .. ""
				end
			end
		end

		vim.api.nvim_chan_send(vim.api.nvim_buf_get_var(ids.buffer_idx, "terminal_job_id"), full_cmd)
	end,

	run = function(self, cmd, opts, on_exit)
		vim.fn.mkdir(get_tmp_dir(), "p")
		local tmp_lock_file = io.open(self.state.tmp_lock_file_name, "w")
		if tmp_lock_file then tmp_lock_file:close() end

		opts = opts or {}
		local terminal_already_exists, buffer_idx = self:_create_or_get_terminal()
		self.state.id = buffer_idx
		local final_win_id = self:_reposition()

		if not terminal_already_exists or self.state.old_id ~= self.state.id then
			self.state.old_id = self.state.id
			self:_send_data_to_terminal({
				buffer_idx = buffer_idx,
				win_id = final_win_id,
			}, opts.env)
		end

		self:_send_data_to_terminal({
			buffer_idx = buffer_idx,
			win_id = final_win_id,
		}, cmd)
		self.state.on_exit_coroutine = coroutine.create(function()
			while vim.uv.fs_stat(self.state.tmp_lock_file_name) do
				vim.defer_fn(function()
					coroutine.resume(self.state.on_exit_coroutine)
				end, 100)
				coroutine.yield()
			end
			local file = io.open(self.state.tmp_exit_code_file_name, "r")
			local exit_code = file and tonumber(file:read("*n"))
			if file then file:close() end
			vim.fn.delete(self.state.tmp_exit_code_file_name, "")
			---@cast exit_code number
			if on_exit then on_exit(exit_code) end

			if exit_code == 0 then
				if self.config.close_on_success then self:close() end
			end
		end)
		coroutine.resume(self.state.on_exit_coroutine)
	end,

	show = function(self)
		if not self.state.id then
			Utils.info("There is no terminal instance")
			return
		end

		local win_id = self:_reposition()
		if win_id ~= -1 then
			vim.api.nvim_win_set_buf(win_id, self.state.id)
			if self.config.auto_resize then
				if self.config.split_direction == "horizontal" then
					vim.api.nvim_win_set_height(win_id, self.config.split_size)
				else
					vim.api.nvim_win_set_width(win_id, self.config.split_size)
				end
			end
		elseif win_id >= -1 then
			vim.cmd(":" .. self.config.split_direction .. " " .. self.config.split_size .. "sp")
			vim.api.nvim_win_set_buf(0, self.state.id)
		end
	end,

	close = function(self)
		if not self.state.id then
			Utils.info("There is no terminal instance")
			return
		end

		local win_id = self:_reposition()
		if win_id ~= -1 then vim.api.nvim_win_close(win_id, false) end
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
---@overload fun(cmd: string[], opts: vim.SystemOpts, on_exit?: fun(code: number))
M.run = create_runner_metatable("runner", Config.runner.type)

---@class xmake.Runners.Execute: xmake.Runner
---@overload fun(cmd: string[], opts: vim.SystemOpts, on_exit?: fun(code: number))
M.exe = create_runner_metatable("execute", Config.execute.type)

return M
