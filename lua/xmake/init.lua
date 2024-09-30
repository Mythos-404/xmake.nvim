---@param module string
---@return table
local function lazy_require(module)
	return setmetatable({}, {
		__index = function(_, key)
			return require(module)[key]
		end,
		__newindex = function(_, key, value)
			require(module)[key] = value
		end,
	})
end

local Xmake = {
	setup = lazy_require("xmake.config")["setup"],

	command = lazy_require("xmake.command"),
	config = lazy_require("xmake.config"),
	action = lazy_require("xmake.action"),
	utils = lazy_require("xmake.utils"),
	info = lazy_require("xmake.info"),
}

return Xmake
