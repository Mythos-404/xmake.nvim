---@param module string
---@return table
local function lazy_require(module)
    return setmetatable({}, {
        __index = function(_, key)
            return require(module)[key]
        end,
        __newindex = function(_, key, value)
            require(module)[key] = value
        end,
    })
end

local Xmake = {
    setup = function(opts)
        lazy_require("xmake.config").setup(opts)
        lazy_require("xmake.command").init()
    end,

    command = lazy_require("xmake.command"),
    config = lazy_require("xmake.config"),
    action = lazy_require("xmake.action"),
    utils = lazy_require("xmake.utils"),
    info = lazy_require("xmake.info"),
    lsp = lazy_require("xmake.lsp"),
}

return Xmake
