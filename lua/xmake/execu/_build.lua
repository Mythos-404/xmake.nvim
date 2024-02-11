local M = {}

local p_info = require("xmake.project").info -- Project Info

local log = require("xmake.log")
local async_exec_commnd = require("xmake.async").exec_commnd

function M.build()
	local target_mode_str = p_info.target.tg .. "(" .. p_info.mode .. ")"
	log.info("Build " .. target_mode_str .. " Start...")
	async_exec_commnd({ "xmake", "-w", p_info.target.tg }, "Build " .. target_mode_str .. " Successfully!")
end
function M.build_all()
	log.info("Build All Start...")
	async_exec_commnd({ "xmake", "-w" }, "Build All " .. "(" .. p_info.mode .. ")" .. " Successfully!")
end
function M.build_target()
	local create_option_target_menu = require("xmake.project._target").create_option_target_menu
	create_option_target_menu(function(target)
		local target_mode_str = target .. "(" .. p_info.mode .. ")"
		log.info("Build " .. target_mode_str .. " Start...")
		async_exec_commnd({ "xmake", "-w", target }, "Build " .. target_mode_str .. " Successfully!")
	end)
end

function M.init()
	local cmd = vim.api.nvim_create_user_command

	cmd("XmakeBuild", M.build, { nargs = 0 })
	cmd("XmakeBuildAll", M.build_all, { nargs = 0 })
	cmd("XmakeBuildTarget", M.build_target, { nargs = 0 })
end

return M
