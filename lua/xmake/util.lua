local M = {}

---@param message string
---@param level integer|nil
function M.notify(message, level)
	vim.notify(message, level, { title = "xmake.nvim" })
end

--- Info Notify
---@param message string
function M.info(message)
	M.notify(message, vim.log.levels.INFO)
end

--- Warn Notify
---@param message string
function M.warn(message)
	M.notify(message, vim.log.levels.WARN)
end

--- Debug Notify
---@param message string
function M.debug(message)
	M.notify(message, vim.log.levels.DEBUG)
end

--- Error Notify
---@param message string
function M.error(message)
	M.notify(message, vim.log.levels.ERROR)
end

return M
