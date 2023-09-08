local M = {}

M.menus = {
	"Target",
	"Buildmode",
	"Platforms",
	"Architectures",
	"Toolchain",
}

function M.init()
	local ui = require("xmake.ui")
	local p_info = require("xmake.project_config").info -- Project Info
	local config = require("xmake.config").config

	ui.create_menu(M.menus, {
		top_text = "Option Menu",
		bottom = ui.box_str(p_info.target.tg, p_info.mode),
		size = config.menu.small_size,
	}, {
		on_submit = function(item)
			local menu = {
				["Target"] = require("xmake.project_config._target").init,
				["Buildmode"] = require("xmake.project_config._mode").init,
				["Platforms"] = require("xmake.project_config._plat_and_arch").init_plat,
				["Architectures"] = require("xmake.project_config._plat_and_arch").init_arch,
				["Toolchain"] = require("xmake.project_config._toolchain").init,
			}

			menu[item.text]()
		end,
	}):mount()
end

return M
