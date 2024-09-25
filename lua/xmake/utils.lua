---@class xmake.Utils
local M = {}
local Config = require("xmake.config")

---@alias NotifyOpts {level?: number, title?: string, icon?: string, once?: boolean, id?:string, hide_from_history?: boolean}
---@type table<string, any>
local notif_ids = {}

---@param msg string|string[]
---@param opts? NotifyOpts
function M.notify(msg, opts)
	opts = opts or {}
	msg = type(msg) == "table" and table.concat(msg, "\n") or msg
	---@cast msg string
	msg = vim.trim(msg)
	local ret = vim[opts.once and "notify_once" or "notify"](msg, opts.level, {
		replace = opts.id and notif_ids[opts.id] or nil,
		title = opts.title or "Xmake.nvim",
		icon = opts.icon,
		hide_from_history = opts.hide_from_history,
		on_open = function(win)
			vim.wo[win].conceallevel = 3
			vim.wo[win].concealcursor = "n"
			vim.wo[win].spell = false
			vim.treesitter.start(vim.api.nvim_win_get_buf(win), "markdown")
		end,
	})
	if opts.id then notif_ids[opts.id] = ret end
	return ret
end

---@param msg string|string[]
---@param id string
---@return fun(): nil call close progress
---@nodiscard
function M.progress(msg, id, spinner_idx)
	local new_spinner_idx = ((spinner_idx or 0) + 1) % #Config.notify.spinner
	spinner_idx = new_spinner_idx
	M.notify(msg, {
		id = id,
		icon = Config.notify.spinner[spinner_idx],
		level = vim.log.levels.INFO,
		hide_from_history = true,
	})

	vim.defer_fn(function()
		if notif_ids[id] then local _ = M.progress(msg, id, spinner_idx) end
	end, Config.notify.refresh_rate_ms)

	return function()
		notif_ids[id] = nil
	end
end

---@param msg string|string[]
---@param opts? NotifyOpts
function M.warn(msg, opts)
	M.notify(msg, vim.tbl_extend("keep", { level = vim.log.levels.WARN }, opts or {}))
end

---@param msg string|string[]
---@param opts? NotifyOpts
function M.info(msg, opts)
	M.notify(msg, vim.tbl_extend("keep", { level = vim.log.levels.INFO }, opts or {}))
end

---@param msg string|string[]
---@param opts? NotifyOpts
function M.error(msg, opts)
	M.notify(msg, vim.tbl_extend("keep", { level = vim.log.levels.ERROR }, opts or {}))
end

---@param msg string|string[]
function M.debug(msg, ...)
	if not Config.debug then return end

	if select("#", ...) > 0 then
		local obj = select("#", ...) == 1 and ... or { ... }
		msg = msg .. "\n```lua\n" .. vim.inspect(obj) .. "\n```"
	end
	M.notify(msg, { title = "Xmake (debug)" })
end

return M
