local M = {}

local function catalogue_detection()
	local files = require("plenary.scandir").scan_dir(".", {
		depth = 1,
		search_pattern = "xmake.lua",
	})

	for _, _ in pairs(files) do
		return true
	end
	return false
end

function M.setup(user_config)
	if catalogue_detection() then
		require("xmake.config").init(user_config)

		require("xmake.set_project").init()
		require("xmake.autocmd").init()
	end
end

return M
