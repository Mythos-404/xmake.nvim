local M = {}

---@param cb fun(): nil
function M.is_xmake_file(cb)
	if vim.fn.expand("%:t") == "xmake.lua" then
		cb()
	end
end

function M.init()
	require("xmake.autocmd._update_intellisense").init()
	require("xmake.autocmd._save_project_info").init()
end

return M
