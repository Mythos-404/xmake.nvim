---@class xmake.Info
local M = {}

local Utils = require("xmake.utils")

---@class xmake.SubInfo
---@field current string
---@field list string[]
---@field private load fun(): nil

---@class xmake.Info
---@field target xmake.SubInfo
---@field mode xmake.SubInfo
---@field arch xmake.SubInfo
---@field plat xmake.SubInfo
---@field toolchain xmake.SubInfo
---@field defer_reload fun(info_name: string): nil
---@field all_defer_reload fun(): nil

---@alias xmake.InfoEnum
---|"target"
---|"mode"
---|"arch"
---|"plat"
---|"toolchain"

---@return any, any, table
local function create_load_function(command)
	local output = vim.system({
		"xmake",
		"lua",
		"--command",
		command,
	}):wait()

	if output.code ~= 0 or not output.stdout or #output.stdout == 0 then
		local error_msg = (
			(output.code ~= 0) and ("Command execution failed with code " .. output.code)
			or "Command executed successfully but returned no output."
		) .. "\nPlease check that your `xmake.lua` configuration is correct."
		Utils.error(error_msg)
		return nil, {}, {}
	end

	local result = vim.json.decode(output.stdout)
	return result.current, result.list, result
end

M.target = {
	current = "",
	list = {},

	load = function()
		_, M.target.list = create_load_function([[
			import("core.base.json")
			import("core.project.config")
			import("core.project.project")

			config.load()
			local targets = {}
			for name, _ in pairs(project.targets()) do
				table.insert(targets, name)
			end
            table.insert(targets, "all")
			print(json.encode({ list = targets }))
		]])
	end,
}

M.mode = {
	current = "",
	list = {},

	load = function()
		M.mode.current, M.mode.list = create_load_function([[
			import("core.base.json")
			import("core.project.config")
			import("core.project.project")

			config.load()
			print(json.encode({ current = config.mode(), list = project.modes() }))
		]])
	end,
}

M.arch = {
	current = "",
	list = {},

	load = function()
		M.arch.current, M.arch.list = create_load_function([[
			import("core.base.json")
			import("core.project.config")
			import("core.platform.platform")

			config.load()
			print(json.encode({ current = config.arch(), list = platform.archs(config.plat()) }))
		]])
	end,
}

M.plat = {
	current = "",
	list = {},

	load = function()
		M.plat.current, M.plat.list = create_load_function([[
			import("core.base.json")
			import("core.project.config")
			import("core.platform.platform")

			config.load()
			print(json.encode({ current = config.plat(), list = platform.plats() }))
		]])
	end,
}

M.toolchain = {
	current = "",
	list = {},

	load = function()
		M.toolchain.current, M.toolchain.list = create_load_function([[
			import("core.base.json")
			import("core.project.config")
			import("core.tool.toolchain")

			config.load()
			print(json.encode({ current = config.get("toolchain"), list = toolchain.list() }))
		]])
	end,
}

---@param info_name xmake.InfoEnum
function M.defer_reload(info_name)
	vim.schedule_wrap(M[info_name].load)
end

function M.all_defer_reload()
	for key, value in pairs(M) do
		if type(value) ~= "function" then M.defer_reload(key) end
	end
end

return M
