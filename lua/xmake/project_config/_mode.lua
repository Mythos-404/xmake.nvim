local M = {}

---@type string[]
M.buildmodes = {}

function M.get_buildmodes()
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({ "xmake", "show", "--list=buildmodes" }, function(data)
		for line in data do
			for mode in line:gmatch("mode%.(%w+)") do
				table.insert(M.buildmodes, mode)
			end
		end
	end)
end

function M.init()
	local ui = require("xmake.ui")
	local p_info = require("xmake.project_config").info -- Project Info
	local config = require("xmake.config").config
	local async_exec_commnd = require("xmake.async").exec_commnd

	ui.create_menu(M.buildmodes, {
		top_text = "Set Buildmode",
		bottom = ui.box_str(p_info.target.tg, p_info.mode),
		size = config.menu.small_size,
	}, {
		on_submit = function(item)
			p_info.mode = item.text
			async_exec_commnd({ "xmake", "config", "--mode=" .. item.text }, "Swich Buildmodes Ok!")
		end,
	}):mount()
end

return M
