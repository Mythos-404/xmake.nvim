local M = {}

function M.init()
	vim.api.nvim_create_autocmd({ "BufWritePost", "BufLeave" }, {
		pattern = "xmake.lua",
		callback = function(_)
			require("xmake.autocmd._update_intellisense").update()
			require("xmake.autocmd._save_project_info").save()
		end,
	})
end

return M
