local M = {}

---@class xmake.Config
M.default_config = {
	debug = false,
}
M.config = {}

function M.setup(opts)
	require("xmake.action").init()
end

return M
