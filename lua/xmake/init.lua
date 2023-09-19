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
}
M.default_config = M.config

local function catalogue_detection()
	local files = require("plenary.scandir").scan_dir(vim.fn.getcwd(), {
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

	if not catalogue_detection() then
		require("xmake.util").warn(("No `xmake.lua` has stopped loading in this directory(%s)"):format(vim.fn.getcwd()))
		return
	end

	require("xmake.set").init()
	require("xmake.commnd").init()
	require("xmake.update_intellisense").init()
end

return M
