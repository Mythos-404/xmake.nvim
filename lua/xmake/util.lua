local M = {}

---@param message string
---@param level integer|nil
function M.notify(message, level)
	vim.notify(message, level, { title = "xmake.nvim" })
end

---@param message string
function M.info(message)
	M.notify(message, vim.log.levels.INFO)
end

---@param message string
function M.warn(message)
	M.notify(message, vim.log.levels.WARN)
end

---@param message string
function M.debug(message)
	M.notify(message, vim.log.levels.DEBUG)
end

---@param message string
function M.error(message)
	M.notify(message, vim.log.levels.ERROR)
end

---@param cmd string
---@param message string
function M.async_exec_commnd(cmd, message)
	local util = require("xmake.util")
	vim.fn.jobstart(cmd, {
		on_stdout = function(_, _, _) end,
		on_stderr = function(_, data, _)
			for i, v in ipairs(data) do
				if string.len(v) ~= 0 then
					util.error(string.format("error:%s,%s", i, v))
				end
			end
		end,
		on_exit = function(_, exit_code, _)
			if exit_code ~= 0 then
				util.error(string.format("error_code:%s", exit_code))
				return
			else
				util.info(message)
			end
		end,
	})
end

return M
