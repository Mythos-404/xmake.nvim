local M = {}

function M.init()
	require("xmake.autocmd.update_intellisense").init()
end

return M
