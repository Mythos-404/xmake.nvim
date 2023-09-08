local M = {}
local Menu = require("nui.menu")
local config = require("xmake.config").config

---@class OnFunc
---@field on_close? fun(): nil
---@field on_submit? fun(item: NuiTree.Node): nil
---@field on_change? fun(item: NuiTree.Node, menu: NuiMenu): nil

---@class MenuConfig
---@field top_text string
---@field bottom? string
---@field size? {width: number, height: number}|string

--- 创建 menu
---@param lines string[]
---@param conf MenuConfig
---@param on_func? OnFunc
function M.create_menu(lines, conf, on_func)
	table.sort(lines)

	local _lines = {}
	for _, line in pairs(lines) do
		table.insert(_lines, Menu.item(line))
	end

	if on_func == nil then
		on_func = {}
	end

	return Menu({
		position = "50%",
		size = conf.size,
		border = {
			text = {
				top = conf.top_text,
				top_align = "center",
				bottom = conf.bottom,
				bottom_align = "right",
			},
			style = config.menu.border_style,
		},
		relative = "editor",
	}, {
		lines = _lines,
		on_change = on_func.on_change,
		on_close = on_func.on_close,
		on_submit = on_func.on_submit,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "q", "Q", "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
	})
end

function M.box_str(str1, str2)
	if not (str1 or str2) then
		return ""
	end

	return config.menu.bottom_text_format:format(str1, str2)
end

return M
