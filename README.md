<p align="right"> <b>| English | <a href="README_zh.md">简体中文</a> |</b> </p>

<h1 align="center">
  Xmake.nvim
</h1>

## 🎐 Features

- Lightning-fast startup speed of 1-3ms (tested on Dell G15 5515 with ArchLinux)
- Automatically generates `compile_commands.json` for _lsp_ when saving `xmake.lua`
- Provides a `run` command, so no need to open an extra window to run a target
- The `lua-lsp` binding is provided so you can happily write `xmake.lua` files

## 🏗 Installation

<details>
  <summary>lazy.nvim</summary>

```lua
{
    "Mythos-404/xmake.nvim",
    version = "^3",
    lazy = true,
    event = "BufReadPost",
    config = true,
}
```

</details>

<details>
  <summary>mini.deps</summary>

```lua
add("Mythos-404/xmake.nvim")
```

</details>

### Requirements

- Neovim 0.10+
- (Optional) [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) for providing a runner
- (Optional) [nvim-dap](https://github.com/mfussenegger/nvim-dap) for debugging support
- (Optional) [nvim-notify](https://github.com/rcarriga/nvim-notify) for enhanced UI for `vim.notify`
- (Optional) Plugins to patch `vim.ui` (e.g., [dressing.nvim](https://github.com/stevearc/dressing.nvim))

## 💡 Commands

- `Xmake[!] run <target|all|@> [args]` Run target
- `Xmake[!] debug <target|all|@> [args]` Debug target
- `Xmake[!] build <target|all|@>` Build target
- `Xmake[!] clean <target|all|@>` Clean target
- `Xmake mode <mode>` Set build mode
- `Xmake arch <arch>` Set target architecture
- `Xmake plat <plat>` Set target platform
- `Xmake toolchain <toolchain>` Set toolchain

> [!Tip]
>
> - `!` will call clean before executing the command
> - `@` executes the last run target
> - `all` will use **xmake**'s `--all` option to run
> - `args` are command line arguments passed to the target

## ⚙️ Default Settings

<details>
  <summary>Default Settings</summary>

```lua
{
    -- Configuration when saving `xmake.lua`
    on_save = {
        -- Reload project information
        reload_project_info = true,
        -- Configuration for generating `compile_commands.json`
        lsp_compile_commands = {
            enable = true,
            -- Directory name (relative path) for output file
            output_dir = "build",
        },
    },

    -- Lsp related configuration
    lsp = {
        enable = true,
        language = "en", ---@type "en"|"zh-cn"
    },

    -- Debugger related configuration
    debuger = {
        -- Checks the project's build mode, and if it’s not among the modes below,
        -- it will automatically switch to `debug` mode for build/run,
        -- and then switch back to the original build mode
        rulus = { "debug", "releasedbg" },
        -- Dap configuration, please refer to Dap and the debugger's documentation
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

    -- Notification related settings
    notify = {
        -- Icons for completion
        icons = {
            error = "",
            successfully = "",
        },
        -- Icons for progress display
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        -- Refresh rate for the progress bar
        refresh_rate_ms = 100,
    },

    -- Runner configuration
    runner = {
        -- Select which backend to use
        type = "toggleterm", ---@type "toggleterm"|"terminal"|"quickfix"

        config = {
            toggleterm = {
                direction = "float", ---@type "vertical"|"horizontal"|"tab"|"float"
                singleton = true,
                auto_scroll = true,
                close_on_success = false,
            },
            terminal = {
                name = "Runner Terminal",
                prefix_name = "[Xmake]: ",
                split_size = 15,
                split_direction = "horizontal", ---@type "vertical"|"horizontal"
                focus = true,
                focus_auto_insert = true,
                auto_resize = true,
                close_on_success = false,
            },
            quickfix = {
                show = "always", ---@type "always"|"only_on_error"
                size = 15,
                position = "botright", ---@type "vertical"|"horizontal"|"leftabove"|"aboveleft"|"rightbelow"|"belowright"|"topleft"|"botright"
                close_on_success = false,
            },
        },
    },
    -- Executor configuration
    execute = {
        -- Select which backend to use
        type = "quickfix", ---@type "toggleterm"|"terminal"|"quickfix"

        config = {
            toggleterm = {
                direction = "float", ---@type "vertical"|"horizontal"|"tab"|"float"
                singleton = true,
                auto_scroll = true,
                close_on_success = true,
            },
            terminal = {
                name = "Executor Terminal",
                prefix_name = "[Xmake]: ",
                split_size = 15,
                split_direction = "horizontal", ---@type "vertical"|"horizontal"
                focus = false,
                focus_auto_insert = true,
                auto_resize = true,
                close_on_success = true,
            },
            quickfix = {
                show = "only_on_error", ---@type "always"|"only_on_error"
                size = 15,
                position = "botright", ---@type "vertical"|"horizontal"|"leftabove"|"aboveleft"|"rightbelow"|"belowright"|"topleft"|"botright"
                close_on_success = true,
            },
        },
    },

    -- Enable development mode
    dev_debug = true,
}
```

</details>

## ✨ Usage with Other Plugins

To use with status line plugins like `lualine.nvim`, here's an example for `lualine.nvim`:

```lua
require("lualine").setup({
    sections = {
       lualine_y = {
            {
                function()
                    if not vim.g.loaded_xmake then return "" end
                    local Info = require("xmake.info")
                    if Info.mode.current == "" then return "" end
                    if Info.target.current == "" then return "Xmake: Not Select Target" end
                    return ("%s(%s)"):format(Info.target.current, Info.mode.current)
                end,
                cond = function()
                    return vim.o.columns > 100
                end,
            }
        }
    }
})
```

## 🎉 Other Projects

- [Civitasv/cmake-tool.nvim](https://github.com/Civitasv/cmake-tools.nvim) Many thanks to this project for providing ideas
