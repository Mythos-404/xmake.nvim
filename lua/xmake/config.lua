---@class xmake.Config.mod: xmake.Config
local M = {}

---@class xmake.Config
local defaults = {
	debug = true,
	run = {
		type = "toggleterm",

		config = {
			toggleterm = {},
			terminal = {},
			quickfix = {},
		},
	},
	execute = {
		type = "quickfix",

		config = {
			toggleterm = {},
			terminal = {},
			quickfix = {},
		},
	},
}

---@type xmake.Config
local options

function M.setup(config)
	options = vim.tbl_deep_extend("force", {}, options or defaults, config or {})
end

return setmetatable(M, {
	__index = function(_, key)
		options = options or M.setup()
		return options[key]
	end,
})
