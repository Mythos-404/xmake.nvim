local M = {}

local config = require("xmake").config

local async_exec_commnd = require("xmake.util").async_exec_commnd

local function create_menu_callback(cb)
	local menu = require("xmake.set").create_menu(
		"Option Target",
		require("xmake.set").create_menu_item([[xmake show -l targets | sed 's/\x1b\[[0-9;]*m//g']], "%S+"),
		function(item)
			M.config.target = item.text
			cb(M.config.target)
		end,
		{
			width = 50,
			height = 15,
		}
	)

	menu:mount()
end

function M.build()
	async_exec_commnd("xmake -w " .. config.target, "Build " .. config.target .. " Successfully!")
end
function M.build_all()
	async_exec_commnd("xmake -w", "Build All Successfully!")
end
function M.build_target()
	create_menu_callback(function(target)
		async_exec_commnd("xmake -w " .. target, "Build " .. target .. " Successfully!")
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

function M.setup()
	local cmd = vim.api.nvim_create_user_command

	cmd("XmakeBuild", function() require("xmake.commnd").build() end, { nargs = 0 })
	cmd("XmakeBuildAll", function() require("xmake.commnd").build_all() end, { nargs = 0 })
	cmd("XmakeBuildTarget", function() require("xmake.commnd").build_target() end, { nargs = 0 })
	cmd("XmakeClean", function() require("xmake.commnd").clean() end, { nargs = 0 })
	cmd("XmakeCleanAll", function() require("xmake.commnd").clean_all() end, { nargs = 0 })
	cmd("XmakeCleanTarget", function() require("xmake.commnd").clean_target() end, { nargs = 0 })
end

return M
