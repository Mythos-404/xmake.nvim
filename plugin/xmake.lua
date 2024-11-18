if vim.g.loaded_xmake then return end
vim.g.loaded_xmake = true

local group = vim.api.nvim_create_augroup("xmake", { clear = true })
local function is_enable()
	local __enable = nil
	return function()
		if __enable == nil then
			if vim.system({ "xmake", "show", "--list=targets" }):wait().code == 0 then
				__enable = true
			else
				__enable = false
			end
		end
		return __enable
	end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = group,
	callback = function()
		if not is_enable()() then return end
		require("xmake").info.all_defer_reload()
		require("xmake").command.init()
	end,
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
	group = group,
	callback = function(args)
		if not is_enable()() then return end
		require("xmake").lsp.init(args)
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = group,
	pattern = "xmake.lua",
	callback = function()
		if not is_enable()() then return end
		local Xmake = require("xmake")
		local on_save = Xmake.config.on_save
		if on_save.reload_project_info then
			Xmake.info.defer_reload("mode")
			Xmake.info.defer_reload("target")
		end
		if on_save.lsp_compile_commands.enable then Xmake.action.project("kind", "compile_commands") end
	end,
})
