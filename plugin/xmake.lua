if vim.g.loaded_xmake then return end
vim.g.loaded_xmake = true

local group = vim.api.nvim_create_augroup("xmake", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = group,
	callback = function()
		require("xmake.info").all_defer_reload()
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = group,
	pattern = "xmake.lua",
	callback = function()
		local on_save = require("xmake.config").on_save
		if on_save.reload_info then
			require("xmake.info").defer_reload("mode")
			require("xmake.info").defer_reload("target")
		end
		if on_save.compile_commands.enable then
			require("xmake.action").project("kind", "compile_commands")
		end
	end,
})
