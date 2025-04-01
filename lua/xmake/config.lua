---@class xmake.Config.mod: xmake.Config
local M = {}

---@class xmake.Config.QuickFix
---@field show "always"|"only_on_error"
---@field size number
---@field position "vertical"|"horizontal"|"leftabove"|"aboveleft"|"rightbelow"|"belowright"|"topleft"|"botright"
---@field close_on_success boolean

---@class xmake.Config.Toggleterm
---@field direction "vertical"|"horizontal"|"tab"|"float"
---@field singleton boolean
---@field auto_scroll boolean
---@field close_on_success boolean

---@class xmake.Config.Snacks
---@field position "top"|"bottom"|"left"|"right"|"float"
---@field start_insert boolean?
---@field auto_insert boolean?
---@field auto_close boolean?
---@field interactive boolean?

---@class xmake.Config.Terminal
---@field name string
---@field prefix_name string
---@field split_size number
---@field split_direction "vertical"|"horizontal"
---@field focus boolean
---@field focus_auto_insert boolean
---@field auto_resize boolean
---@field close_on_success boolean

---@alias xmake.Config.RunnerTypes "toggleterm"|"terminal"|"quickfix"|"snacks"

---@alias xmake.Config.LspLibraryLanguage "zh-cn"|"en"

---@class xmake.Config
local defaults = {
    on_save = {
        reload_project_info = true,
        lsp_compile_commands = {
            enable = true,
            output_dir = "build",
        },
    },

    lsp = {
        enable = true,
        ---@type xmake.Config.LspLibraryLanguage
        language = "en",
    },

    debuger = {
        rulus = { "debug", "releasedbg" },
        dap = {
            name = "Xmake Debug",
            type = "codelldb",
            request = "launch",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            stopOnEntry = false,
            runInTerminal = true,
        },
    },

    notify = {
        icons = {
            error = "",
            successfully = "",
        },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        refresh_rate_ms = 100,
    },

    runner = {
        ---@type xmake.Config.RunnerTypes
        type = "toggleterm",

        config = {
            ---@type xmake.Config.Toggleterm
            toggleterm = {
                direction = "float",
                singleton = true,
                auto_scroll = true,
                close_on_success = false,
            },
            ---@type xmake.Config.Terminal
            terminal = {
                name = "Runner Terminal",
                prefix_name = "[Xmake]: ",
                split_size = 15,
                split_direction = "horizontal",
                focus = true,
                focus_auto_insert = true,
                auto_resize = true,
                close_on_success = false,
            },
            ---@type xmake.Config.QuickFix
            quickfix = {
                show = "always",
                size = 15,
                position = "topleft",
                close_on_success = false,
            },
            ---@type xmake.Config.Snacks
            snacks = {
                position = "float",
                interactive = true,
            },
        },
    },
    execute = {
        ---@type xmake.Config.RunnerTypes
        type = "quickfix",

        config = {
            ---@type xmake.Config.Toggleterm
            toggleterm = {
                direction = "float",
                singleton = true,
                auto_scroll = true,
                close_on_success = true,
            },
            ---@type xmake.Config.Terminal
            terminal = {
                name = "Executor Terminal",
                prefix_name = "[Xmake]: ",
                split_size = 15,
                split_direction = "horizontal",
                focus = false,
                focus_auto_insert = true,
                auto_resize = true,
                close_on_success = true,
            },
            ---@type xmake.Config.QuickFix
            quickfix = {
                show = "only_on_error",
                size = 15,
                position = "botright",
                close_on_success = true,
            },
            snacks = {
                position = "float",
                interactive = true,
            },
        },
    },

    dev_debug = true,
}

---@type xmake.Config
local options

function M.setup(config)
    options = vim.tbl_deep_extend("force", {}, options or defaults, config or {})
end

return setmetatable(M, {
    __index = function(_, key)
        options = options or M.setup()
        return options[key]
    end,
})
