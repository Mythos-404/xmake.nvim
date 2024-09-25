local M = {}
local Actions = require("xmake.action")
local Info = require("xmake.info")
local Utils = require("xmake.utils")

local function find_subcmd(keys, arg_lead)
	return vim.iter(keys)
		:filter(function(key)
			return key:find(arg_lead) ~= nil
		end)
		:totable()
end

local function create_complete_func(list_name)
	return function(subcmd_arg_lead)
		return find_subcmd(Info[list_name].list, subcmd_arg_lead)
	end
end

---@type table<string, xmake.CmdSubcommand>
M.action = {
	run = {
		impl = function(args, opts)
			local target = args[1]
			if target == "" and not Info.target.current then target = Info.target.current end
			Utils.debug("", { target, Info.target })

			if not vim.tbl_contains(Info.target.list, target) then
				Utils.error("Please provide a correct target name")
				return
			end

			Actions.run(target, opts)
		end,

		complete = create_complete_func("target"),
	},
	build = {
		impl = function(args, opts)
			local target = args[1]
			if target == "" and Info.target.current then target = Info.target.current end

			if not vim.tbl_contains(Info.target.list, target) then
				Utils.error("Please provide a correct target name")
				return
			end

			Actions.build(target, opts)
		end,

		complete = create_complete_func("target"),
	},
	clean = {
		impl = function(args, opts)
			local target = args[1]
			if target == "" and Info.target.current then target = Info.target.current end

			if not vim.tbl_contains(Info.target.list, target) then
				Utils.error("Please provide a correct target name")
				return
			end

			Actions.clean(target, opts)
		end,

		complete = create_complete_func("target"),
	},
	debug = {
		impl = function(args, opts)
			local has_nvim, dap = pcall(require, "dap")
			if not has_nvim then return end

			local target = args[1]
			if target == "" and not Info.target.current then target = Info.target.current end

			if not vim.tbl_contains(Info.target.list, target) then
				Utils.error("Please provide a correct target name")
				return
			end
		end,

		complete = create_complete_func("target"),
	},

	mode = {
		impl = function(args, opts)
			local mode_name = args[1]
			if not vim.tbl_contains(Info.mode.list, mode_name) then
				Utils.error("Please provide a correct mode name")
				return
			end

			Actions.setting("mode", mode_name, opts)
		end,

		complete = create_complete_func("mode"),
	},
	plat = {
		impl = function(args, opts) end,

		complete = create_complete_func("plat"),
	},
	arch = {
		impl = function(args, opts) end,

		complete = create_complete_func("arch"),
	},
	toolchain = {
		impl = function(args, opts) end,

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
