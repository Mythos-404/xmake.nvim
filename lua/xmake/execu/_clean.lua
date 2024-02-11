local M = {}

local p_info = require("xmake.project").info -- Project Info
local async_exec_commnd = require("xmake.async").exec_commnd

function M.clean()
	async_exec_commnd({ "xmake", "clean", p_info.target.tg }, "Clean " .. p_info.target.tg .. " Successfully!")
end
function M.clean_all()
	async_exec_commnd({ "xmake", "clean", "--all" }, "Clean All Successfully!")
end
function M.clean_target()
	local create_option_target_menu = require("xmake.project._target").create_option_target_menu
	create_option_target_menu(function(target)
		async_exec_commnd({ "xmake", "clean", target }, "Clean " .. target .. " Successfully!")
	end)
end

function M.init()
	local cmd = vim.api.nvim_create_user_command

	cmd("XmakeClean", M.clean, { nargs = 0 })
	cmd("XmakeCleanAll", M.clean_all, { nargs = 0 })
	cmd("XmakeCleanTarget", M.clean_target, { nargs = 0 })
end

return M
