local M = {}

M.config = {
	files_path = vim.fn.stdpath("cache") .. "/xmake_",

	compile_command = {
		lsp = "clangd",
		dir = ".vscode",
	},

	debug = false,
}
M.default_config = M.config

function M.init(conf)
	conf = conf or {}
	M.config = vim.tbl_deep_extend("keep", conf, M.default_config)
end

return M
