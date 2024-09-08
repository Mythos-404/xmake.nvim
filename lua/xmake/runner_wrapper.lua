---@class xmake.Runners
local M = {}

local Config = require("xmake.config")
local Utils = require("xmake.utils")

---@param str string
local function clean_ASCI_color(str)
	if not str then return "" end
	return str:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
end

---@class xmake.Runner
---@field run fun(self: self, cmd: string[], opts: vim.SystemObj, on_exit?: fun(out: vim.SystemCompleted)): vim.SystemObj
---@field show fun(self: self): nil
---@field close fun(): nil

local runners = {}

---@class xmake.Runner.QuickFix: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: vim.SystemObj, on_exit?: fun(out: vim.SystemCompleted)): vim.SystemObj
---@field show fun(self: self): nil
---@field close fun(): nil
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
				Utils.info(("A Xmake task completed: `%s`"):format(table.concat(cmd, " ")))
				if self.config.close_on_success then self:close() end
				return
			end
			if out.code ~= 0 then
				Utils.error(("A Xmake task encountered an error: `%s`"):format(table.concat(cmd, " ")))
				if self.config.show ~= "only_on_error" then return end
				self:show()
				vim.api.nvim_command("cbottom")
			end
		end)

		vim.fn.setqflist({}, " ", { title = table.concat(cmd, " ") })

		if self.config.show == "always" then self:show() end

		return vim.system(cmd, _opts, _on_exit)
	end,

	show = function(self)
		vim.api.nvim_command(self.config.position .. " copen " .. self.config.size)
		vim.api.nvim_command("wincmd p")
	end,

	close = function()
		vim.api.nvim_command("cclose")
	end,
}

---@class xmake.Runner.Toggleterm
runners.toggleterm = { config = nil }

---@class xmake.Runner.Terminal
runners.terminal = { config = nil }

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
