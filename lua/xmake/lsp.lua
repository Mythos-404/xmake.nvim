local M = {}
local Config = require("xmake.config")
local Utils = require("xmake.utils")

---@param client table
---@param method string
---@param params any
local function lsp_notify(client, method, params)
    -- 0.11+ uses methods (`client:notify`); 0.10 uses a function field (`client.notify`).
    -- `vim.version().minor >= 10` is true for both, so it cannot distinguish them.
    if vim.fn.has("nvim-0.11") == 1 then
        client:notify(method, params)
    else
        client.notify(method, params)
    end
end

function M.init(args)
    if not Config.lsp.enable then return end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if client.name ~= "lua_ls" then return end

    client.settings = Utils.merge({
        Lua = {
            workspace = {
                library = {},
            },
        },
    }, client.settings)
    vim.list_extend(client.settings.Lua.workspace.library, { Utils.path("addons") .. "/" .. Config.lsp.language })

    if client.config then client.config.settings = client.settings end

    -- Send the real settings so lua_ls picks up addons/ library injection.
    lsp_notify(client, "workspace/didChangeConfiguration", { settings = client.settings })
end

return M
