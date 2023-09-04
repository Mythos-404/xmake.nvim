local M = {}

local config = require("xmake.config").config
local async_exec_commnd = require("xmake.async").async_exec_commnd

function M.update()
	if vim.fn.expand("%:t") == "xmake.lua" then
		async_exec_commnd({
			"xmake",
			"project",
			"-k",
			"compile_commands",
			"--lsp=" .. config.compile_command.lsp,
			config.compile_command.dir,
		}, "Update Intellisense Ok!")
	end
end

function M.init()
	vim.api.nvim_command([[ autocmd BufWritePost xmake.lua lua require("xmake.autocmd.update_intellisense").update() ]])
end

return M
