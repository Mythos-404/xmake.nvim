---@class xmake.Actions
local M = {}
local Utils = require("xmake.utils")
local Info = require("xmake.info")

function M.run() end

---@param target string
---@param opts UserCommandCallOpts
---@param callback? fun(out: vim.SystemCompleted): nil
function M.build(target, opts, callback) end

function M.clean() end

function M.setting() end

return M
