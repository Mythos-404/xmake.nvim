local M = {}
local Util = require("xmake.util")

---@class xmake.CmdSubcommand
---@field impl fun(args: string[], opts: table) The command implementation
---@field complete? fun(subcmd_arg_lead: string): string[] (optional) Command completions callback, taking the lead of the subcommand's arguments
---@field show? fun(): nil

---@type table<string, xmake.CmdSubcommand>
M.action = {
	menu = require("xmake.action.menu"),

	toolchain = require("xmake.action.toolchain"),
	mode = require("xmake.action.mode"),
	plat = require("xmake.action.plat"),
	build = require("xmake.action.build"),
	clean = require("xmake.action.clean"),
	run = require("xmake.action.run"),
	debug = require("xmake.action.debug"),
}

local function xmake_command(opts)
	local fargs = opts.fargs
	local cmd = fargs[1]
	local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
	local command = M.action[cmd]
	if not command then
		Util.error("Unknown command: " .. cmd)
		return
	end
	command.impl(args, opts)
end

function M.init()
	vim.api.nvim_create_user_command("Xmake", xmake_command, {
		nargs = "+",
		desc = "",
		bang = true,
		complete = function(arg_lead, cmdline, _)
			local subcmd, subcmd_arg_lead = cmdline:match("^Xmake[!]*%s(%S+)%s(.*)$")
			if subcmd and subcmd_arg_lead and M.action[subcmd] and M.action[subcmd].complete then
				return M.action[subcmd].complete(subcmd_arg_lead)
			end

			if cmdline:match("^['<,'>]*Xmake[!]*%s+%w*$") then
				local subcmd_keys = vim.tbl_keys(M.action)
				return vim.iter(subcmd_keys)
					:filter(function(key)
						return key:find(arg_lead) ~= nil
					end)
					:totable()
			end
		end,
	})
end

return M
