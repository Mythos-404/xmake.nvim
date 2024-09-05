local M = {}
local Utils = require("xmake.utils")
local Info = require("xmake.info")

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
	menu = { impl = function(args, opts) end },

	run = {
		impl = function(args, opts) end,

		complete = create_complete_func("target"),
	},
	build = {
		impl = function(args, opts)
			local target = args[1]
			local build_args = { "build", target }
			if target == "" and not Info.target.current then target = Info.target.current end

			if not vim.tbl_contains(Info.target.list, target) then
				Utils.error("Please provide a correct target name")
				return
			end

			if opts.bang then table.insert(build_args, 2, "--rebuild") end

			Utils.run_xmake_command(build_args, function(out)
				if out.code ~= 0 then return end
				Info.target.current = target
			end)
		end,

		complete = create_complete_func("target"),
	},
	clean = {
		impl = function(args, opts)
			local target = args[1]
			local build_args = { "clean" }
			if target == "" and not Info.target.current then target = Info.target.current end

			if not opts.bang then
				if not vim.tbl_contains(Info.target.list, target) then
					Utils.error("Please provide a correct target name")
					return
				end
				table.insert(build_args, target)
			else
				table.insert(build_args, "--all")
			end

			Utils.run_xmake_command(build_args)
		end,

		complete = create_complete_func("target"),
	},
	debug = {
		impl = function(args, opts)
			local has_nvim, dap = pcall(require, "dap")
			if not has_nvim then return end

			local target = args[1]
			local build_args = { "build", target }
			if target == "" and not Info.target.current then target = Info.target.current end

			if not vim.tbl_contains(Info.target.list, target) then
				Utils.error("Please provide a correct target name")
				return
			end

			local old_mode = Info.mode.current
			if not vim.tbl_contains({ "debug", "releasedbg" }, Info.mode.current) then
				Utils.run_xmake_command({ "config", "--mode=" .. "debug" })
			end

			--- HACK: 太史了这段代码, 等待重写
			if opts.bang then table.insert(build_args, 2, "--rebuild") end
			Utils.run_xmake_command(build_args, function(out)
				if out.code ~= 0 then return end
				Info.debug.load(target)
				dap.run({
					name = target,
					program = Info.debug.program,
					cwd = Info.debug.cwd,
					request = "launch",
					type = "codelldb",
				})
				Info.mode.current = old_mode
			end)
		end,

		complete = create_complete_func("target"),
	},

	mode = {
		impl = function(args, opts)
			if #args == 0 or #args > 1 then
				if not Info.mode.current then
					Utils.info("Not UI") -- TODO: 还未编写 UI
					return
				end
				return
			end
		end,

		complete = create_complete_func("mode"),
	},
	plat = {
		impl = function(args, opts)
			if #args == 0 or #args > 1 then
				if not Info.plat.current then
					Utils.info("Not UI") -- TODO: 还未编写 UI
					return
				end
				return
			end
		end,

		complete = create_complete_func("plat"),
	},
	arch = {
		impl = function(args, opts)
			if #args == 0 or #args > 1 then
				if not Info.arch.current then
					Utils.info("Not UI") -- TODO: 还未编写 UI
					return
				end
				return
			end
		end,

		complete = create_complete_func("arch"),
	},
	toolchain = {
		impl = function(args, opts)
			if #args == 0 or #args > 1 then
				if not Info.target.current then
					Utils.info("Not UI") -- TODO: 还未编写 UI
					return
				end
				return
			end
		end,

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
