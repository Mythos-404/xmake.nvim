---@class xmake.Runners
local M = {}

local Config = require("xmake.config")

---@class xmake.Runner
---@field run fun(): nil
---@field show fun(): nil
---@field close fun(): nil

---@type table<string, xmake.Runner>
local runners = {}

runners.quickfix = {}
runners.toggleterm = {}
runners.terminal = {}

---@class xmake.Runners.Runner: xmake.Runner
M.run = setmetatable({}, {
	__call = function(_, ...)
		return runners[Config.run.type].run(...)
	end,
	__index = function(_, key)
		return runners[Config.run.type][key]
	end,
})

---@class xmake.Runners.Execute: xmake.Runner
M.exe = setmetatable({}, {
	__call = function(_, ...)
		return runners[Config.execute.type].run(...)
	end,
	__index = function(_, key)
		return runners[Config.execute.type][key]
	end,
})

return M
