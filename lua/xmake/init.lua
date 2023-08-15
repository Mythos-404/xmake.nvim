local M = {}

M.config = {
	plat = "",
	arch = "",
	mode = "",
	toolchain = "",
	target = "",
	targets = {},
	target_exec_path = "",
	compile_commands_dir = ".vscode",
}
M.default_config = M.config

function M.setup(user_conf)
	user_conf = user_conf or {}
	M.config = vim.tbl_deep_extend("keep", user_conf, M.default_config)

	require("xmake.set").setup()
	require("xmake.commnd").setup()
	require("xmake.update_intellisense").setup()
end

return M
