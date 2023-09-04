local M = {}

local config = require("xmake.config").config
local util = require("xmake.util")

---去除ASCII的特殊字符
---@param str string
---@return string
local function remove_ansii_code(str)
	if str == nil then
		return ""
	end

	str = str:gsub("\x1b%[%d+;%d+;%d+;%d+;%d+m", "")
		:gsub("\x1b%[%d+;%d+;%d+;%d+m", "")
		:gsub("\x1b%[%d+;%d+;%d+m", "")
		:gsub("\x1b%[%d+;%d+m", "")
		:gsub("\x1b%[%d+m", "")
	return str
end

--- 包装执行函数
--- 为其添加其他功能
---@param cmd string[]
---@param cb function
---@param message? string
---@return function
local function warpper_on_exit(cmd, cb, message)
	return function(sc) ---@param sc SystemCompleted
		local stdout, stderr = remove_ansii_code(sc.stdout), remove_ansii_code(sc.stderr)

		if sc.code ~= 0 then
			util.error(string.format("Exec: %s(%s)", table.concat(cmd, " "), sc.code))
			if config.debug then
				util.error(string.format("Error Out:\n%s", stderr))
				util.error(string.format("Out:\n%s", stdout))
			end
			return
		end

		cb(stdout)

		if message ~= nil then
			util.info(message)
		end
	end
end

--- 执行命令
---@param cmd string[]
---@param on_exit string|function(string)
---@param message? string
function M.async_exec_commnd(cmd, on_exit, message)
	local cb = nil
	if type(on_exit) == "string" then
		cb = warpper_on_exit(cmd, function() end, on_exit)
	else
		cb = warpper_on_exit(cmd, on_exit, message)
	end

	vim.system(cmd, { text = true }, cb)
end

return M
