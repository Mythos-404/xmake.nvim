local M = {}

function M.init()
	require("xmake.execu._build").init()
	require("xmake.execu._clean").init()
end

return M
