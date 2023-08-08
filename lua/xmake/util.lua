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

return M
