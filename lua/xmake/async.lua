local M = {}

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
---@param cb function|string
---@param message? string
---@return fun(sc: SystemCompleted)
local function warpper_on_exit(cmd, cb, message)
	local log = require("xmake.log")
	local config = require("xmake.config").config

	return vim.schedule_wrap(function(sc)
		local stdout, stderr = remove_ansii_code(sc.stdout), remove_ansii_code(sc.stderr)

		if config.debug then
			log.error(string.format("Error Out:\n%s", stderr))
			log.error(string.format("Out:\n%s", stdout))
		end

		if sc.code ~= 0 then
			log.error(string.format("Exec: %s(%s)", table.concat(cmd, " "), sc.code))
			return
		end

		if type(cb) ~= "function" then
			log.info(cb)
			return
		end

		cb(stdout:gmatch("[^\n]+"))

		if message ~= nil then
			log.info(message)
		end
	end)
end

--- 执行命令
---@param cmd string[]
---@param on_exit string|fun(data: string)
---@param message? string
function M.exec_commnd(cmd, on_exit, message)
	local config = require("xmake.config").config

	vim.system(cmd, {
		cwd = config.work_dir,
		text = true,
	}, warpper_on_exit(cmd, on_exit, message))
end

return M
