---@class xmake.Actions
local M = {}

local Info = require("xmake.info")
local Utils = require("xmake.utils")
local Config = require("xmake.config")
local Runner = require("xmake.runner_wrapper")

---@param id string
---@return string
local function random_id(id)
	return id .. math.random(1, 1000)
end
math.randomseed(os.time())

---@param id string
---@param action string
---@return function, string
local function start_action(id, action)
	local progress_id = random_id(id)
	local close_progress = Utils.progress(("%s..."):format(action), progress_id)
	return close_progress, progress_id
end

---@param action string
---@param is_success boolean
---@param code integer
---@param progress_id string
local function notify_result(action, is_success, code, progress_id)
	local status_msg = ("%s %s"):format(action, is_success and "Successfully!" or "Failed With Code " .. code)
	Utils.notify(status_msg, {
		id = progress_id,
		level = vim.log.levels[is_success and "INFO" or "ERROR"],
		icon = Config.notify.icons[is_success and "successfully" or "error"],
	})
end

---@param command string[]
---@param action_desc string
---@param callback? fun(code: integer): nil
local function run_xmake_command(command, action_desc, callback)
	local close_progress, progress_id = start_action(command[2], action_desc)

	Runner.exe(command, {}, function(code)
		local is_success = (code == 0)
		notify_result(action_desc, is_success, code, progress_id)
		close_progress()

		if callback then vim.schedule_wrap(callback)(code) end
	end)
end

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.build(target, opts, callback)
	opts = opts or {}

	if opts.bang then
		opts.bang = false
		M.clean(target, opts, function(_)
			M.build(target, opts, callback)
		end)
		return
	end

	local target_and_mode = ("%s(%s)"):format(target, Info.mode.current)
	target = (target == "all") and "--all" or target
	run_xmake_command({ "xmake", "build", target }, ("Building %s"):format(target_and_mode), callback)
end

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.clean(target, opts, callback)
	opts = opts or {}
	target = (target == "all") and "--all" or target

	run_xmake_command({ "xmake", "clean", target }, ("Cleaning %s"):format(target), callback)
end

---@param target string|"all"
---@param args string[]
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.run(target, args, opts, callback)
	M.build(target, opts, function(_)
		Runner.run({ "xmake", "run", target == "all" and "--all" or target, unpack(args) }, {}, function(code)
			if callback then vim.schedule_wrap(callback)(code) end
		end)
	end)
end

---@param target string
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
---@param old_mode? string
function M.debug(target, opts, callback, old_mode)
	local has_nvim, dap = pcall(require, "dap")
	if not has_nvim then return end

	old_mode = old_mode or Info.mode.current
	if not vim.tbl_contains(Config.debuger.rulus, Info.mode.current) then
		M.setting("mode", "debug", opts, function()
			M.debug(target, opts, callback, old_mode)
		end)
		return
	end

	M.build(target, opts, function(code)
		if code ~= 0 then return end
		local output = vim.system({
			"xmake",
			"lua",
			"--command",
			([[
                import("core.base.json")
                import("core.project.project")
                import("core.project.config").load()
                print(json.encode(project.target("%s"):targetfile()))]]):format(target),
		}):wait()

		if output.code ~= 0 or not output.stdout or #output.stdout == 0 then
			local error_msg = (output.code ~= 0) and ("Command execution failed with code " .. output.code)
				or "Command executed successfully but returned no output.\nPlease check that your `xmake.lua` configuration is correct."
			Utils.error(error_msg)
			return
		end

		dap.run(vim.tbl_extend("force", { program = vim.json.decode(output.stdout) }, Config.debuger.dap))
		if not vim.tbl_contains(Config.debuger.rulus, old_mode) then M.setting("mode", old_mode, opts) end
	end)
end

---@param option string
---@param target string
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.setting(option, target, opts, callback)
	opts = opts or {}

	if Info[option].current == target then
		Utils.notify(("Setting %s %s Successfully!"):format(option, target), {
			id = random_id("setting"),
			level = vim.log.levels.INFO,
			icon = Config.notify.icons.successfully,
		})
		return
	end

	run_xmake_command(
		{ "xmake", "config", ("--%s=%s"):format(option, target) },
		("Setting %s %s"):format(option, target),
		function(code)
			Info.defer_reload(option)
			Info.defer_reload("mode")
			if callback then callback(code) end
		end
	)
end

---@param option string
---@param target string
---@param opts? UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.project(option, target, opts, callback)
	opts = opts or {}
	local option_and_target = ("%s %s"):format(option, target)

	run_xmake_command(
		{ "xmake", "project", ("--%s=%s"):format(option, target), Config.on_save.compile_commands.output_dir },
		("Project %s"):format(option_and_target),
		callback
	)
end

return M
