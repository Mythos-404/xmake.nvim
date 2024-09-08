---@class xmake.Config.mod: xmake.Config
local M = {}

---@class xmake.Config.QuickFix
---@field show "always"|"only_on_error"
---@field size number
---@field position "botright"|"topleft"
---@field close_on_success boolean

---@class xmake.Config
local defaults = {
	debug = true,
	runner = {
		type = "toggleterm",

		config = {
			toggleterm = {},
			terminal = {},
			---@type xmake.Config.QuickFix
			quickfix = {
				show = "always",
				size = 10,
				position = "topleft",
				close_on_success = false,
			},
		},
	},
	execute = {
		type = "quickfix",

		config = {
			toggleterm = {},
			terminal = {},
			---@type xmake.Config.QuickFix
			quickfix = {
				show = "always",
				size = 10,
				position = "botright",
				close_on_success = false,
			},
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
