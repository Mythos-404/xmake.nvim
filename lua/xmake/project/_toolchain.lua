local M = {}

M.toolchain_infos = {}

function M.get_toolchains()
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({ "xmake", "show", "--list=toolchains" }, function(data)
		for line in data do
			local toolchain = line:match("^%s*([^%s]+)")
			if toolchain then
				table.insert(M.toolchain_infos, toolchain)
			end
		end
	end)
end

function M.open()
	local ui = require("xmake.ui")
	local p_info = require("xmake.project").info -- Project Info
	local config = require("xmake.config").config
	local async_exec_commnd = require("xmake.async").exec_commnd

	ui.create_menu(
		M.toolchain_infos,
		{ top_text = "Set Toolchain", bottom = p_info.toolchain, size = config.menu.size },
		{
			on_submit = function(item)
				p_info.toolchain = item.text
				async_exec_commnd({ "xmake", "config", "--toolchain=" .. item.text }, "Swich Toolchain Ok!")
			end,
		}
	)
		:mount()
end

return M
