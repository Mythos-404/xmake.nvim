---@class xmake.Config.mod: xmake.Config
local M = {}

---@class xmake.Config.QuickFix
---@field show "always"|"only_on_error"
---@field size number
---@field position "botright"|"topleft"
---@field close_on_success boolean

---@class xmake.Config.Toggleterm
---@field direction "vertical"|"horizontal"|"tab"|"float"
---@field singleton boolean
---@field auto_scroll boolean
---@field close_on_success boolean

---@class xmake.Config
local defaults = {
	debug = true,
	runner = {
		type = "toggleterm",

		config = {
			---@type xmake.Config.Toggleterm
			toggleterm = {
				direction = "float",
				singleton = true,
				auto_scroll = true,
				close_on_success = true,
			},
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
			---@type xmake.Config.Toggleterm
			toggleterm = {
				direction = "float",
				singleton = true,
				auto_scroll = true,
				close_on_success = true,
			},
			terminal = {},
			---@type xmake.Config.QuickFix
			quickfix = {
				show = "only_on_error",
				size = 10,
				position = "botright",
				close_on_success = true,
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
