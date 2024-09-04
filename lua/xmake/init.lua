local M = {}

function M.setup(opts)
	require("xmake.config").setup(opts)
	require("xmake.action").init()
end

return M
