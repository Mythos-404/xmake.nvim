local M = {}

M.plat_arch_info = {}

function M.get_plat_and_arch()
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({ "xmake", "show", "--list=architectures" }, function(data)
		for line in data do
			local parts = {}
			for part in line:gmatch("%S+") do
				table.insert(parts, part)
			end
			local platform = table.remove(parts, 1)
			M.plat_arch_info[platform] = parts
		end
	end)
end

function M.init_arch()
	local ui = require("xmake.ui")
	local p_info = require("xmake.project_config").info -- Project Info
	local config = require("xmake.config").config
	local async_exec_commnd = require("xmake.async").exec_commnd

	ui.create_menu(M.plat_arch_info[p_info.plat], {
		top_text = "Set Architectures",
		bottom = ui.box_str(p_info.plat, p_info.arch),
		size = config.menu.size,
	}, {
		on_submit = function(item)
			p_info.arch = item.text
			async_exec_commnd({ "xmake", "config", "--arch=" .. item.text }, "Swich Architectures Ok!")
		end,
	}):mount()
end

function M.init_plat()
	local ui = require("xmake.ui")
	local p_info = require("xmake.project_config").info -- Project Info
	local config = require("xmake.config").config
	local async_exec_commnd = require("xmake.async").exec_commnd

	local plats = {}
	for plat, _ in pairs(M.plat_arch_info) do
		table.insert(plats, plat)
	end

	ui.create_menu(plats, {
		top_text = "Set Platforms",
		bottom = ui.box_str(p_info.plat, p_info.arch),
		size = config.menu.size,
	}, {
		on_submit = function(item)
			p_info.plat = item.text
			async_exec_commnd({ "xmake", "config", "--plat=" .. item.text }, "Swich Platforms Ok!")
		end,
	}):mount()
end

return M
