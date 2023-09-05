local M = {}
local config = require("xmake.config").config

local context_manager = require("plenary.context_manager")
local open = context_manager.open
local with = context_manager.with

M.info = {
	plat = "",
	arch = "",
	mode = "",
	toolchain = {
		tl = "",
		tls = {},
	},

	--target = {
	--  tg = "",
	--  exec_path = "",
	--  tgs = {},
	--}
	target = with(open(config.files_path .. "project_info.json", "a+"), function(reader)
		reader = reader:read("*a")
		local data = vim.json.decode(#reader ~= 0 and reader or "{}")[vim.fn.getcwd()]
		return data ~= nil and data or { tg = "", exec_path = "", tgs = {} }
	end),
}

--- 注册命令
---@param cmd string
---@param func function
local function reg_cmd(cmd, func)
	vim.api.nvim_create_user_command(cmd, function()
		func()
	end, { nargs = 0 })
end

function M.init()
	reg_cmd("XmakeSetMenu", require("xmake.project_config._menu").init)
	reg_cmd("XmakeSetToolchain", require("xmake.project_config._toolchain").init)
	reg_cmd("XmakeSetMode", require("xmake.project_config._mode").init)
	reg_cmd("XmakeSetTarget", require("xmake.project_config._target").init)
	reg_cmd("XmakeSetPlat", require("xmake.project_config._plat").init)
	reg_cmd("XmakeSetArch", require("xmake.project_config._arch").init)
end

return M
