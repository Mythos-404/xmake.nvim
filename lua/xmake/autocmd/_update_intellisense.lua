local M = {}

function M.update()
	local config = require("xmake.config").config
	local async_exec_commnd = require("xmake.async").exec_commnd
	local is_xmake_file = require("xmake.autocmd").is_xmake_file

	is_xmake_file(function()
		async_exec_commnd({
			"xmake",
			"project",
			"-k",
			"compile_commands",
			"--lsp=" .. config.compile_command.lsp,
			config.compile_command.dir,
		}, "Update Intellisense Ok!")
	end)
end

function M.init()
	vim.api.nvim_command(
		[[ autocmd BufWritePost xmake.lua lua require("xmake.autocmd._update_intellisense").update() ]]
	)
end

return M
