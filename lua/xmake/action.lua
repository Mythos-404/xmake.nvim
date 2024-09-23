---@class xmake.Actions
local M = {}
local Info = require("xmake.info")
local Utils = require("xmake.utils")
local Runner = require("xmake.runner_wrapper")

function M.run() end

---@param target string
---@param opts UserCommandCallOpts
---@param callback? fun(out: vim.SystemCompleted): nil
function M.build(target, opts, callback)
	Runner.exe({ "xmake", "build", target }, {}, function(code) end)
end

function M.clean() end

function M.setting() end

return M
