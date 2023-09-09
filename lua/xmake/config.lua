local M = {}

M.config = {
	files_path = vim.fn.stdpath("cache") .. "/xmake_",

	compile_command = {
		lsp = "clangd",
		dir = ".vscode",
	},

	menu = {
		size = { width = 25, height = 20 },
		bottom_text_format = "%s(%s)",
		border_style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},

	debug = false,

	work_dir = vim.fn.getcwd(),
}
M.default_config = M.config

function M.init(conf)
	conf = conf or {}
	M.config = vim.tbl_deep_extend("keep", conf, M.default_config)
end

return M
