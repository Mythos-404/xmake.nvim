local M = {}
local config = require("xmake.config").config

local context_manager = require("plenary.context_manager")
local open = context_manager.open
local with = context_manager.with

---@class ProjectInfo
---@field plat string
---@field arch string
---@field mode string
---@field toolchain string
---@field target {tg: string, exec_path: string}
M.info = {
	plat = "",
	arch = "",
	mode = "",
	toolchain = "",

	target = with(open(config.files_path .. "project_info.json", "a+"), function(reader)
		reader = reader:read("*a")
		local data = vim.json.decode(#reader ~= 0 and reader or "{}")[config.work_dir]
		return data ~= nil and data or { tg = "", exec_path = "" }
	end),
}

local function get_all_info()
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({ "xmake", "show" }, function(data)
		for line in data do
			local plat = string.match(line, "plat: (.*)$")
			local arch = string.match(line, "arch: (.*)$")
			local mode = string.match(line, "mode: (.*)$")

			if plat ~= nil then
				M.info.plat = plat
			end

			if arch ~= nil then
				M.info.arch = arch
			end

			if mode ~= nil then
				M.info.mode = mode
			end
		end

		require("xmake.project._target").get_targets()
		require("xmake.project._mode").get_buildmodes()
		require("xmake.project._plat_and_arch").get_plat_and_arch()
		require("xmake.project._toolchain").get_toolchains()
	end)
end

function M.init()
	local cmd = vim.api.nvim_create_user_command

	cmd("XmakeSetMenu", require("xmake.project._menu").open, { nargs = 0 })
	cmd("XmakeSetToolchain", require("xmake.project._toolchain").open, { nargs = 0 })
	cmd("XmakeSetMode", require("xmake.project._mode").open, { nargs = 0 })
	cmd("XmakeSetTarget", require("xmake.project._target").open, { nargs = 0 })
	cmd("XmakeSetArch", require("xmake.project._plat_and_arch").open_arch, { nargs = 0 })
	cmd("XmakeSetPlat", require("xmake.project._plat_and_arch").open_plat, { nargs = 0 })

	get_all_info()
end

return M
