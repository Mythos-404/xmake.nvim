---@class xmake.Info
local M = {}
local Utils = require("xmake.utils")

---@param command string
---@return string|nil,string[]
local function create_load_function(command)
	local out = Utils.run_xmake_command({
		"lua",
		"--command",
		command,
	}):wait()

	if out.code ~= 0 then
		Utils.error(
			"Command execution failed with code "
				.. out.code
				.. ".\nPlease make sure the plugin is activated in a directory containing `xmake.lua`."
		)
		return nil, {}
	end

	if not out.stdout or #out.stdout == 0 then
		Utils.error(
			"Command executed successfully but returned no output.\nPlease check that your `xmake.lua` configuration is correct."
		)
		return nil, {}
	end

	local result = vim.json.decode(out.stdout)
	return result.current, result.list
end

M.target = {
	current = nil,
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
			print(json.encode({ list = targets }))
		]])
		if not M.target.current then
			return
		end
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

---@param info_name "target"|"mode"|"arch"|"plat"|"toolchain"
function M.defer_reload(info_name)
	vim.defer_fn(M[info_name].load, 1)
end

function M.all_defer_reload()
	for key, value in pairs(M) do
		if type(value) ~= "function" then
			M.defer_reload(key)
		end
	end
end

return M
