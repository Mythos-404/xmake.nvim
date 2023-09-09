local M = {}

---@type string[]
M.targets = {}

function M.get_targets()
	local p_info = require("xmake.project_config").info -- Project Info
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({ "xmake", "show", "--list=targets" }, function(data)
		M.targets = {}
		for line in data do
			for target in line:gmatch("%S+") do
				table.insert(M.targets, target)
			end
		end
		p_info.target.tg = p_info.target.tg ~= "" and p_info.target.tg or M.targets[1]
		M.get_target_exec_path()
	end)
end

function M.get_target_exec_path()
	local p_info = require("xmake.project_config").info -- Project Info
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({ "xmake", "show", "--target=" .. p_info.target.tg }, function(data)
		for line in data do
			local path = line:match("targetfile: (.-)$")
			if path ~= nil then
				p_info.target.exec_path = path
				return
			end
		end
	end)
end

function M.init()
	local ui = require("xmake.ui")
	local util = require("xmake.util")
	local p_info = require("xmake.project_config").info -- Project Info
	local config = require("xmake.config").config

	ui.create_menu(
		M.targets,
		{ top_text = "Swich Target", bottom = ui.box_str(p_info.target.tg, p_info.mode), size = config.menu.size },
		{
			on_submit = function(item)
				p_info.target.tg = item.text
				M.get_target_exec_path()
				util.info("Set Target Ok!")
			end,
		}
	):mount()
end

return M
