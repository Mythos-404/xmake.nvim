-- Guard against re-sourcing the plugin file. `vim.g.loaded_xmake` is the
-- *current* project enablement flag (lualine / user configs) and must not
-- lock the plugin off for the rest of the session.
if vim.g.xmake_nvim_loaded then return end
vim.g.xmake_nvim_loaded = true

local group = vim.api.nvim_create_augroup("xmake", { clear = true })

---@type string|nil
local last_root
local debounce_seq = 0

---@param buf integer|nil
---@return boolean
local function is_enable(buf)
    local Utils = require("xmake.utils")
    local root = Utils.find_xmake_root(buf)
    vim.g.loaded_xmake = root ~= nil
    return vim.g.loaded_xmake
end

--- Reload project info when the xmake.lua root actually changes.
--- find_xmake_root is cached; this debounce avoids extra work on bursty events.
---@param buf integer|nil
local function on_context_changed(buf)
    debounce_seq = debounce_seq + 1
    local seq = debounce_seq
    vim.defer_fn(function()
        if seq ~= debounce_seq then return end
        if not is_enable(buf) then
            last_root = nil
            return
        end
        local root = require("xmake.utils").find_xmake_root(buf)
        if root == last_root then return end
        last_root = root
        require("xmake").info.all_defer_reload()
    end, 120)
end

vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = group,
    callback = function(args)
        if not is_enable(args.buf) then return end
        require("xmake").lsp.init(args)
    end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    group = group,
    pattern = "xmake.lua",
    callback = function(args)
        require("xmake.utils").invalidate_xmake_root_cache()
        if not is_enable(args.buf) then return end
        last_root = require("xmake.utils").find_xmake_root(args.buf)
        require("xmake").info.all_defer_reload()
    end,
})

vim.api.nvim_create_autocmd({ "UIEnter" }, {
    group = group,
    callback = function()
        if not is_enable() then return end
        last_root = require("xmake.utils").find_xmake_root()
        require("xmake").info.defer_reload("target")
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
    group = group,
    callback = function(args)
        on_context_changed(args.buf)
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = group,
    pattern = "xmake.lua",
    callback = function(args)
        if not is_enable(args.buf) then return end
        local Xmake = require("xmake")
        local on_save = Xmake.config.on_save
        if on_save.reload_project_info then
            Xmake.info.defer_reload("mode")
            Xmake.info.defer_reload("target")
        end
        if on_save.lsp_compile_commands.enable then Xmake.action.project("kind", "compile_commands") end
    end,
})
