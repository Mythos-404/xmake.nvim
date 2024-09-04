---@meta
error("Not require meta file")

---@class xmake.CmdSubcommand
---@field impl fun(args: string[], opts: UserCommandCallOpts) The command implementation
---@field complete? fun(subcmd_arg_lead: string): string[] (optional) Command completions callback, taking the lead of the subcommand's arguments
---@field show? fun(): nil

---@class xmake.SubInfo
---@field current string|nil
---@field list string[]
---@field private load fun(): nil

---@class xmake.Info
---@field target xmake.SubInfo
---@field mode xmake.SubInfo
---@field arch xmake.SubInfo
---@field plat xmake.SubInfo
---@field toolchain xmake.SubInfo
---@field defer_reload fun(info_name: string): nil
---@field all_defer_reload fun(): nil

---@class UserCommandCallOpts
---@field name string Command name
---@field args string The args passed to the command
---@field fargs string[] The args split by unescaped whitespace (when more than one argument is allowed)
---@field nargs? string Number of arguments |:h command-nargs|
---@field bing boolean "true" if the command was executed with a ! modifier
---@field line1 number The starting line of the command range
---@field line2 number The final line of the command range
---@field range 0|1|2 The number of items in the command range 0, 1, or 2
---@field mods string Command modifiers
---@field smods table Command modifiers in a structured format.
