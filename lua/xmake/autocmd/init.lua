local M = {}

function M.init()
	require("xmake.autocmd._update_intellisense").init()
	require("xmake.autocmd._save_project_info").init()
end

return M
