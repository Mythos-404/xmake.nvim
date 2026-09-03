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

---@type xmake.InfoEnum[]
local INFO_KEYS = { "target", "mode", "arch", "plat", "toolchain" }

---@type table<xmake.InfoEnum, string>
local COMMANDS = {
    target = [[
			local json = import("core.base.json")
			local config = import("core.project.config")
			local project = import("core.project.project")

			config.load()
			local targets = {}
			for name, _ in pairs(project.targets()) do table.insert(targets, name) end
            table.insert(targets, "all")
			print(json.encode({ list = targets }))
		]],
    mode = [[
			local json = import("core.base.json")
			local config = import("core.project.config")
			local project = import("core.project.project")

			config.load()
			print(json.encode({ current = config.mode(), list = project.modes() }))
		]],
    arch = [[
			local json = import("core.base.json")
			local config = import("core.project.config")
			local platform = import("core.platform.platform")

			config.load()
			print(json.encode({ current = config.arch(), list = platform.archs(config.plat()) }))
		]],
    plat = [[
			local json = import("core.base.json")
			local config = import("core.project.config")
			local platform = import("core.platform.platform")

			config.load()
			print(json.encode({ current = config.plat(), list = platform.plats() }))
		]],
    toolchain = [[
			local json = import("core.base.json")
			local config = import("core.project.config")
			local toolchain = import("core.tool.toolchain")

			config.load()
			print(json.encode({ current = config.get("toolchain"), list = toolchain.list() }))
		]],
}

---@class xmake.InfoStore
---@field target { current: string, list: string[] }
---@field mode { current: string, list: string[] }
---@field arch { current: string, list: string[] }
---@field plat { current: string, list: string[] }
---@field toolchain { current: string, list: string[] }
---@field loaded table<string, boolean>
---@field loading table<string, boolean>

---@type table<string, xmake.InfoStore>
local stores = {}

---@return xmake.InfoStore
local function new_store()
    return {
        target = { current = "", list = {} },
        mode = { current = "", list = {} },
        arch = { current = "", list = {} },
        plat = { current = "", list = {} },
        toolchain = { current = "", list = {} },
        loaded = {},
        loading = {},
    }
end

---@return xmake.InfoStore
---@return string|nil
local function get_store()
    local root = Utils.find_xmake_root()
    if not root then return new_store(), nil end
    if not stores[root] then stores[root] = new_store() end
    return stores[root], root
end

---@param store xmake.InfoStore
---@param name xmake.InfoEnum
---@param output vim.SystemCompleted
local function apply_output(store, name, output)
    store.loading[name] = false
    if output.code ~= 0 or not output.stdout or #output.stdout == 0 then
        local error_msg = (not output.stdout or #output.stdout == 0)
                and "Command executed successfully but returned no output"
            or "Command execution failed with code " .. output.code
        Utils.error(error_msg)
        return
    end

    local result = Utils.decode_xmake_json(output.stdout)
    if type(result) ~= "table" then
        Utils.error("Failed to parse JSON output")
        return
    end

    if result.list then store[name].list = result.list end
    if result.current == vim.NIL then
        store[name].current = ""
    elseif result.current ~= nil then
        store[name].current = result.current
    end
    store.loaded[name] = true
end

---@param name xmake.InfoEnum
---@param sync boolean
local function start_load(name, sync)
    local store, root = get_store()
    if not root then return end
    if store.loading[name] then return end

    local command = COMMANDS[name]
    if not command then return end

    store.loading[name] = true
    local cmd = { "xmake", "lua", "--command", command }
    local opts = { text = true, cwd = root }

    if sync then
        apply_output(store, name, vim.system(cmd, opts):wait())
        return
    end

    vim.system(cmd, opts, function(output)
        vim.schedule(function()
            local target_store = stores[root]
            if not target_store then return end
            apply_output(target_store, name, output)
        end)
    end)
end

---@param name xmake.InfoEnum
---@return xmake.SubInfo
local function make_subinfo(name)
    return setmetatable({}, {
        __index = function(_, key)
            if key == "load" then
                return function()
                    start_load(name, false)
                end
            end
            local store = get_store()
            if (key == "list" or key == "current") and not store.loaded[name] and not store.loading[name] then
                -- First read from commands/completion: wait so the list is populated.
                start_load(name, true)
            end
            return store[name][key]
        end,
        __newindex = function(_, key, value)
            local store = get_store()
            store[name][key] = value
        end,
    })
end

M.target = make_subinfo("target")
M.mode = make_subinfo("mode")
M.arch = make_subinfo("arch")
M.plat = make_subinfo("plat")
M.toolchain = make_subinfo("toolchain")

---@param info_name xmake.InfoEnum
function M.defer_reload(info_name)
    vim.schedule(function()
        start_load(info_name, false)
    end)
end

function M.all_defer_reload()
    for _, key in ipairs(INFO_KEYS) do
        M.defer_reload(key)
    end
end

return M
