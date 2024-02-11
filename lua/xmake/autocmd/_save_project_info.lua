local M = {}

function M.save()
	if vim.fn.expand("%:t") ~= "xmake.lua" then
		return
	end

	local config = require("xmake.config").config

	local context_manager = require("plenary.context_manager")
	local open = context_manager.open
	local with = context_manager.with

	local project_info = require("xmake.project").info.target
	require("xmake.project._target").get_targets()

	with(open(config.files_path .. "project_info.json", "r"), function(reader)
		local data = reader:read("*a")
		data = vim.json.decode(#data ~= 0 and data or "{}")
		data[config.work_dir] = project_info

		with(open(config.files_path .. "project_info.json", "w"), function(reader_)
			reader_:write(vim.json.encode(data))
		end)
	end)
end

return M
