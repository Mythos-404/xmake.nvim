return function()
    if not vim.g.loaded_xmake then return "" end
    local Info = require("xmake.info")
    if Info.mode.current == "" then return "Xmake: Not Build Mode" end
    if Info.target.current == "" then return "Xmake: Not Select Target" end
    return ("%s(%s)"):format(Info.target.current, Info.mode.current)
end
