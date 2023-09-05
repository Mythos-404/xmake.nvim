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
	-- 检测是否有 vim.system 这个函数和运行目录是否有 `xmake.lua`
	if vim.system ~= nil and catalogue_detection() then
		require("xmake.config").init(user_config)

		require("xmake.project_config").init()
		require("xmake.autocmd").init()
	end
end

return M
