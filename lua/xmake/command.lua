local M = {}

local Info = require("xmake.info")
local Utils = require("xmake.utils")
local Actions = require("xmake.action")

---@class xmake.CmdSubcommand
---@field impl fun(args: string[], opts: UserCommandCallOpts) The command implementation
---@field complete? fun(subcmd_arg_lead: string): string[] (optional) Command completions callback, taking the lead of the subcommand's arguments
---@field show? fun(): nil

---@param keys string[]
---@param arg_lead string
---@return string[]
local function find_subcmd(keys, arg_lead)
	return vim.iter(keys)
		:filter(function(key)
			return key:find(arg_lead) ~= nil
		end)
		:totable()
end

---@param list_name string
---@return fun(subcmd_arg_lead: string): string[]
local function create_complete_func(list_name)
	return function(subcmd_arg_lead)
		return find_subcmd(Info[list_name].list, subcmd_arg_lead)
	end
end

---@param action_name string
---@param action_func function
---@param invalid_target_check? function
---@param error_message? string
local function create_action_handler(action_name, action_func, invalid_target_check, error_message)
	return function(args, opts)
		local target = args[1] ~= "@" and args[1] or (Info.target.current ~= "" and Info.target.current or nil)
		if not target then
			vim.ui.select(
				Info.target.list,
				{ prompt = ("Select %s target"):format(action_name) },
				vim.schedule_wrap(function(tg)
					if not tg or tg == "" then return end
					Info.target.current = tg
					M.action[action_name].impl({ tg, unpack(args) }, opts)
				end)
			)
			return
		end

		if not vim.tbl_contains(Info.target.list, target) then
			Utils.error("Please provide a correct target name")
			return
		end

		if invalid_target_check and invalid_target_check(target) and error_message then
			Utils.error(error_message)
			return
		end

		Info.target.current = target
		action_func(target, vim.list_slice(args, 2), opts)
	end
end

---@param setting_name string
---@return fun(args: string, opts: UserCommandCallOpts): nil
local function create_setting_handler(setting_name)
	return function(args, opts)
		local names = args[1]
		if not vim.tbl_contains(Info[setting_name].list, names) then
			Utils.error(("Please provide a correct %s name"):format(setting_name))
			return
		end

		Actions.setting(setting_name, names, opts)
	end
end

---@type table<string, xmake.CmdSubcommand>
M.action = {
	run = {
		impl = create_action_handler("run", function(target, args, opts)
			Actions.run(target, args, opts)
		end),
		complete = create_complete_func("target"),
	},
	build = {
		impl = create_action_handler("build", function(target, _, opts)
			Actions.build(target, opts)
		end),
		complete = create_complete_func("target"),
	},
	clean = {
		impl = create_action_handler("clean", function(target, _, opts)
			Actions.clean(target, opts)
		end),
		complete = create_complete_func("target"),
	},
	debug = {
		impl = create_action_handler("debug", function(target, _, opts)
			Actions.debug(target, opts)
		end, function(target)
			return target == "all"
		end, "Debug cannot run on `all` target"),
		complete = create_complete_func("target"),
	},

	mode = {
		impl = create_setting_handler("mode"),

		complete = create_complete_func("mode"),
	},
	plat = {
		impl = create_setting_handler("plat"),

		complete = create_complete_func("plat"),
	},
	arch = {
		impl = create_setting_handler("arch"),

		complete = create_complete_func("arch"),
	},
	toolchain = {
		impl = create_setting_handler("toolchain"),

		complete = create_complete_func("toolchain"),
	},
}

---@param opts UserCommandCallOpts
local function xmake_command(opts)
	local fargs = opts.fargs
	local cmd = fargs[1]
	local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
	local command = M.action[cmd]
	if not command then
		Utils.error("Unknown command: " .. cmd)
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
				return find_subcmd(subcmd_keys, arg_lead)
			end
		end,
	})
end

return M
