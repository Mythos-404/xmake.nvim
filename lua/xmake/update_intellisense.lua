local M = {}

function M.update_intellisense()
	if vim.fn.expand("%:t") == "xmake.lua" then
		-- "xmake project -k compile_commands --lsp=clangd " .. require("xmake").config.compile_commands_dir,
		require("xmake.util").async_exec_commnd(
			{
				"xmake",
				"project",
				"-k",
				"compile_commands",
				"--lsp=clangd",
				require("xmake").config.compile_commands_dir,
			},
			"Update Intellisense Ok!"
		)
		require("xmake.set").get_targets()
	end
end

function M.init()
	vim.api.nvim_command(
		"autocmd BufWritePost xmake.lua lua require('xmake.update_intellisense').update_intellisense()"
	)
end

return M
