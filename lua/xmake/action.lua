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

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.run(target, opts, callback)
	opts = opts or {}
	M.build(target, opts, function(_)
		target = (target == "all") and "--all" or target
		Runner.run({ "xmake", "run", target }, {}, function(code)
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
	opts = opts or {}
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

		if output.code ~= 0 then
			Utils.error(
				"Command execution failed with code "
					.. output.code
					.. ".\nPlease make sure the plugin is activated in a directory containing `xmake.lua`."
			)
		end
		if not output.stdout or #output.stdout == 0 then
			Utils.error(
				"Command executed successfully but returned no output.\nPlease check that your `xmake.lua` configuration is correct."
			)
		end

		dap.run(vim.tbl_extend("force", {
			program = vim.json.decode(output.stdout),
		}, Config.dap))
		M.setting("mode", old_mode, opts)
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

	local progress_id = random_id("build")
	local target_and_mode = ("%s(%s)"):format(target, Info.mode.current)
	local close_progress = Utils.progress(("Building %s..."):format(target_and_mode), progress_id)
	target = (target == "all") and "--all" or target
	Runner.exe({ "xmake", "build", target }, {}, function(code)
		local is_success = (code == 0)
		local status_msg = ("Build %s %s"):format(
			target_and_mode,
			is_success and "Successfully!" or "Failed With Code " .. code
		)
		Utils.notify(status_msg, {
			id = progress_id,
			level = is_success and vim.log.levels.INFO or vim.log.levels.ERROR,
			icon = is_success and Config.notify.icons.successfully or Config.notify.icons.error,
		})
		close_progress()

		if callback then vim.schedule_wrap(callback)(code) end
	end)
end

---@param target string|"all"
---@param opts UserCommandCallOpts
---@param callback? fun(out: any): nil
function M.clean(target, opts, callback)
	opts = opts or {}
	local progress_id = random_id("clean")
	local close_progress = Utils.progress(("Cleaning %s..."):format(target), progress_id)
	target = (target == "all") and "--all" or target
	Runner.exe({ "xmake", "clean", target }, {}, function(code)
		local is_success = (code == 0)
		local status_msg = ("Clean %s %s"):format(target, is_success and "Successfully!" or "Failed With Code " .. code)
		Utils.notify(status_msg, {
			id = progress_id,
			level = is_success and vim.log.levels.INFO or vim.log.levels.ERROR,
			icon = is_success and Config.notify.icons.successfully or Config.notify.icons.error,
		})
		close_progress()

		if callback then vim.schedule_wrap(callback)(code) end
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
			icon = is_success and Config.notify.icons.successfully or Config.notify.icons.error,
		})
		close_progress()

		Info.defer_reload(option)
		Info.defer_reload("mode")
		if callback then vim.schedule_wrap(callback)(code) end
	end)
end

return M
