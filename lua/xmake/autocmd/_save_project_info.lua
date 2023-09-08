local M = {}

function M.save()
	local config = require("xmake.config").config
	local is_xmake_file = require("xmake.autocmd").is_xmake_file

	local context_manager = require("plenary.context_manager")
	local open = context_manager.open
	local with = context_manager.with

	is_xmake_file(function()
		local project_info = require("xmake.project_config").info.target
		require("xmake.project_config._target").get_targets()

		with(open(config.files_path .. "project_info.json", "w+"), function(reader)
			local data = reader:read("*a")
			data = vim.json.decode(#data ~= 0 and data or "{}")
			data[config.work_dir] = project_info
			reader:write(vim.json.encode(data))
		end)
	end)
end

function M.init()
	vim.api.nvim_command([[ autocmd BufWritePost xmake.lua lua require("xmake.autocmd._save_project_info").save() ]])
end

return M
