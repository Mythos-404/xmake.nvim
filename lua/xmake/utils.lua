---@class xmake.Utils
local M = {}

local Config = require("xmake.config")

---@alias NotifyOpts {level?: number, time?: number, title?: string, icon?: string, once?: boolean, id?:string, hide_from_history?: boolean}
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
        id = opts.id and notif_ids[opts.id] or nil, -- NOTE: 兼容 `folke/snacks.nvim`
        replace = opts.id and notif_ids[opts.id] or nil, -- NOTE: 兼容 `rcarriga/nvim-notify`

        time = opts.time,
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
    if opts.id then notif_ids[opts.id] = type(ret)=="table" and vim.tbl_get(ret, "id") or ret end -- NOTE: 在使用 `folke/noice.nvim` 后返回的 id 奇怪的被 table 包裹了
    -- NOTE: `folke/snacks.nvim` 提供的`notify()`， 在`:bc0630e`版本（其他版本也可能？）id没有被table包裹
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
    if not Config.dev_debug then return end

    if select("#", ...) > 0 then
        local obj = select("#", ...) == 1 and ... or { ... }
        msg = msg .. "\n```lua\n" .. vim.inspect(obj) .. "\n```"
    end
    M.notify(msg, { title = "Xmake (debug)" })
end

--- 合并 Table
---@vararg table
---@return table
function M.merge(...)
    local function can_merge(v)
        return type(v) == "table" and (vim.tbl_isempty(v) or not vim.islist(v))
    end

    local values = { ... }
    local ret = values[1]
    for i = 2, #values, 1 do
        local value = values[i]
        if can_merge(ret) and can_merge(value) then
            for k, v in pairs(value) do
                ret[k] = M.merge(ret[k], v)
            end
        else
            ret = value
        end
    end
    return ret
end

--- 返回插件目录的拼接
---@param path_name string
---@return string
function M.path(path_name)
    local f = debug.getinfo(1, "S").source:sub(2)
    local fname = vim.fn.fnamemodify(f, ":h:h:h") .. "/" .. (path_name or "")
    return vim.uv.fs_realpath(fname) or fname
end

return M
