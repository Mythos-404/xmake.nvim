---@class xmake.Config.mod: xmake.Config
local M = {}

---@class xmake.Config.QuickFix
---@field show "always"|"only_on_error"
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
				position = "botright",
				close_on_success = true,
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
				show = "only_on_error",
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
