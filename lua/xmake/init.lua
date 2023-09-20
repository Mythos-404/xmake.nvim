local M = {}

M.config = {
	plat = "",
	arch = "",
	mode = "",
	toolchain = "",
	toolchains = {},
	target = "",
	targets = {},
	target_exec_path = "",
	compile_commands_dir = ".vscode",
	work_dir = vim.fn.getcwd() == vim.fn.getenv("HOME") and vim.fn.expand("%:p:h") or vim.fn.getcwd(),
}
M.default_config = M.config

local function catalogue_detection()
	local files = require("plenary.scandir").scan_dir(M.config.work_dir, {
		depth = 1,
		search_pattern = "xmake.lua",
	})

	for _, _ in pairs(files) do
		return true
	end
	return false
end

function M.setup(user_conf)
	user_conf = user_conf or {}
	M.config = vim.tbl_deep_extend("keep", user_conf, M.default_config)

	vim.cmd("cd " .. M.config.work_dir)
	if not catalogue_detection() then
		require("xmake.util").warn(
			("No `xmake.lua` has stopped loading in this directory(%s)"):format(M.config.work_dir)
		)
		return
	end

	require("xmake.set").init()
	require("xmake.commnd").init()
	require("xmake.update_intellisense").init()
end

return M
