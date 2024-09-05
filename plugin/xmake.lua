if vim.g.loaded_xmake then return end
vim.g.loaded_xmake = true

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		require("xmake.info").all_defer_reload()
	end,
})
