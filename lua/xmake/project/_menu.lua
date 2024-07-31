local M = {}

M.menus = {
	["Target"] = require("xmake.project._target").open,
	["Buildmode"] = require("xmake.project._mode").open,
	["Platforms"] = require("xmake.project._plat_and_arch").open_plat,
	["Architectures"] = require("xmake.project._plat_and_arch").open_arch,
	["Toolchain"] = require("xmake.project._toolchain").open,
}

function M.open()
	local ui = require("xmake.ui")
	local p_info = require("xmake.project").info -- Project Info
	local config = require("xmake.config").config

	ui.create_menu(vim.tbl_keys(M.menus), {
		top_text = "Option Menu",
		bottom = ui.box_str(p_info.target.tg, p_info.mode),
		size = config.menu.size,
	}, {
		on_submit = function(item)
			M.menus[item.text]()
		end,
	}):mount()
end

return M
