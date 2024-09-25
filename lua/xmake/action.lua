---@class xmake.Actions
local M = {}
local Info = require("xmake.info")
local Utils = require("xmake.utils")
local Config = require("xmake.config")
local Runner = require("xmake.runner_wrapper")

---@param id string
---@return string
local function random_id(id)
	math.randomseed(os.time())
	return id .. math.random(1, 1000)
end

---@param action string
---@param target string
---@param opts table
---@param callback? fun(code: number)
local function run_xmake_cmd(action, target, opts, callback)
	opts = opts or {}
	local progress_id = random_id(action)
	local target_and_mode = ("%s(%s)"):format(target, Info.mode.current)
	local close_progress = Utils.progress(("%s %s..."):format(action, target_and_mode), progress_id)

	Runner.exe({ "xmake", action, (target == "all" and "--all" or target) }, {}, function(code)
		local is_success = (code == 0)
		local status_msg = ("%s %s %s"):format(
			action:gsub("^%l", string.upper),
			target_and_mode,
			is_success and "Successfully!" or "Failed With Code " .. code
		)
		Utils.notify(status_msg, {
			id = progress_id,
			level = vim.log.levels[is_success and "INFO" or "ERROR"],
			icon = Config.notify.icons[is_success and "successfully" or "error"],
		})
		close_progress()

		if callback then vim.schedule_wrap(callback)(code) end
	end)
end

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.build(target, opts, callback)
	if opts and opts.bang then
		opts.bang = false
		M.clean(target, opts, function(_)
			M.build(target, opts, callback)
		end)
		return
	end
	run_xmake_cmd("build", target, opts, callback)
end

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.clean(target, opts, callback)
	run_xmake_cmd("clean", target, opts, callback)
end

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.run(target, opts, callback)
	M.build(target, opts, function(_)
		Runner.run({ "xmake", "run", target == "all" and "--all" or target }, {}, function(code)
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
	if not vim.tbl_contains({ "debug", "releasedbg" }, Info.mode.current) then
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

		dap.run(vim.tbl_extend("force", { program = vim.json.decode(output.stdout) }, Config.dap))
		M.setting("mode", old_mode, opts)
	end)
end

---@param option string
---@param target string
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.setting(option, target, opts, callback)
	opts = opts or {}
	local progress_id = random_id("setting")
	local option_and_target = ("%s %s"):format(option, target)
	local close_progress = Utils.progress(("Setting %s..."):format(option_and_target), progress_id)

	Runner.exe({ "xmake", "config", ("--%s=%s"):format(option, target) }, {}, function(code)
		local is_success = (code == 0)
		local status_msg = ("Setting %s %s"):format(
			option_and_target,
			is_success and "Successfully!" or "Failed With Code " .. code
		)
		Utils.notify(status_msg, {
			id = progress_id,
			level = is_success and vim.log.levels.INFO or vim.log.levels.ERROR,
			icon = Config.notify.icons[is_success and "successfully" or "error"],
		})
		close_progress()

		Info.defer_reload(option)
		Info.defer_reload("mode")
		if callback then vim.schedule_wrap(callback)(code) end
	end)
end

return M
