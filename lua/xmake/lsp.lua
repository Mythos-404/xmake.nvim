local M = {}
local Config = require("xmake.config")
local Utils = require("xmake.utils")

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

    client.notify("workspace/didChangeConfiguration", {
        settings = { Lua = {} },
    })
end

return M
