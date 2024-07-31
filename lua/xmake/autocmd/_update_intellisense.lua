local M = {}

function M.update()
	if vim.fn.expand("%:t") ~= "xmake.lua" then
		return
	end

	local config = require("xmake.config").config
	local async_exec_commnd = require("xmake.async").exec_commnd

	async_exec_commnd({
		"xmake",
		"project",
		"-k",
		"compile_commands",
		"--lsp=" .. config.compile_command.lsp,
		config.compile_command.dir,
	}, "Update Intellisense Ok!")
end

return M
