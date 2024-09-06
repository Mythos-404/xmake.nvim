local M = {}

function M.setup(opts)
	require("xmake.config").setup(opts)
	require("xmake.command").init()
end

return M
