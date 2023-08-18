local M = {}

local config = require("xmake").config

local util = require("xmake.util")
local async_exec_commnd = util.async_exec_commnd

local function create_menu_callback(cb)
	local menu = require("xmake.set").create_menu(
		"Option Target",
		require("xmake.set").create_target_menu_items(),
		function(item)
			config.target = item.text
			cb(config.target)
		end,
		{
			width = 50,
			height = 15,
		}
	)

	menu:mount()
end

function M.build()
	local target_mode_str = config.target .. "(" .. config.mode .. ")"
	util.info("Build " .. target_mode_str .. " Start...")
	async_exec_commnd("xmake -w " .. config.target, "Build " .. target_mode_str .. " Successfully!")
end
function M.build_all()
	util.info("Build All Start...")
	async_exec_commnd("xmake -w", "Build All " .. "(" .. config.mode .. ")" .. " Successfully!")
end
function M.build_target()
	create_menu_callback(function(target)
		local target_mode_str = target .. "(" .. config.mode .. ")"
		util.info("Build " .. target_mode_str .. " Start...")
		async_exec_commnd("xmake -w " .. target, "Build " .. target_mode_str .. " Successfully!")
	end)
end

function M.clean()
	async_exec_commnd("xmake clean " .. config.target, "Clean " .. config.target .. " Successfully!")
end
function M.clean_all()
	async_exec_commnd("xmake clean --all", "Clean All Successfully!")
end
function M.clean_target()
	create_menu_callback(function(target)
		async_exec_commnd("xmake clean " .. target, "Clean " .. target .. " Successfully!")
	end)
end

function M.init()
	local cmd = vim.api.nvim_create_user_command

	cmd("XmakeBuild", function() require("xmake.commnd").build() end, { nargs = 0 })
	cmd("XmakeBuildAll", function() require("xmake.commnd").build_all() end, { nargs = 0 })
	cmd("XmakeBuildTarget", function() require("xmake.commnd").build_target() end, { nargs = 0 })
	cmd("XmakeClean", function() require("xmake.commnd").clean() end, { nargs = 0 })
	cmd("XmakeCleanAll", function() require("xmake.commnd").clean_all() end, { nargs = 0 })
	cmd("XmakeCleanTarget", function() require("xmake.commnd").clean_target() end, { nargs = 0 })
end

return M
