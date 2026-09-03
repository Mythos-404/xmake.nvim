<p align="right"><b>| <a href="README.md">English</a> | 简体中文 |</b></p>

<h1 align="center">
  Xmake.nvim
</h1>

## 🎐 特征

- 有着飞快的启动速度 1-3ms (在 Dell G15 5515 中系统为 ArchLinux)
- 在保存`xmake.lua`文件时自动生成供*lsp*使用的`compile_commands.json`
- 提供了`run`命令不用再打开额外的窗口来运行目标
- 提供了`lua-lsp`绑定可以快乐的编写`xmake.lua`文件了

## 🏗 安装

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

### 安装需求

- Neovim 0.10+
- (可选) [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) 提供运行器
- (可选) [snacks.nvim](https://github.com/folke/snacks.nvim) 提供运行器
- (可选) [nvim-dap](https://github.com/mfussenegger/nvim-dap) 提供调试功能
- (可选) [nvim-notify](https://github.com/rcarriga/nvim-notify) 为 `vim.notify` 提供更好的 UI
- (可选) 对 `vim.ui` 提供补丁的插件 (e.g. [dressing.nvim](https://github.com/stevearc/dressing.nvim))

## 💡 命令

- `Xmake[!] run <target|all|@> [args]` 运行目标
- `Xmake[!] debug <target|all|@> [args]` 调试目标
- `Xmake[!] build <target|all|@>` 构建目标
- `Xmake[!] clean <target|all|@>` 清理目标
- `Xmake mode <mode>` 设置编译模式
- `Xmake arch <arch>` 设置目标架构
- `Xmake plat <plat>` 设置目标平台
- `Xmake toolchain <toolchain>` 设置工具链

> [!Tip]
>
> - `!` 添加后会在执行命令前调用清理
> - `@` 执行前一次运行的目标
> - `all` 会使用**xmake**的的`--all`来运行
> - `args` 传递给目标的命令行参数

## ⚙️ 默认设置

<details>
  <summary>默认设置</summary>

```lua
{
    -- 在保存`xmake.lua`时的配置
    on_save = {
        -- 重新加载项目信息
        reload_project_info = true,
        -- `compile_commands.json` 的生成配置
        lsp_compile_commands = {
            enable = true,
            -- 输出的文件的目录名称(相对路径)
            output_dir = "build",
        },
    },

    -- Lsp 有关的配置
    lsp = {
        -- 默认启用 lsp 注入
        enable = true,
        -- 注入后显示的语言
        language = "en", ---@type "en"|"zh-cn"
    },

    -- 调试有关配置
    debuger = {
        -- 检测项目的构建模式, 如果不是下方中的目标将
        -- 自动切换为 `debug` 模式来构建运行,
        -- 并且自动切回原构建模式
        rules = { "debug", "releasedbg" },
        -- Dap 配置, 请自行查询 Dap 和调试器的文档
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

    -- 通知有关功能
    notify = {
        -- 完成图标
        icons = {
            error = "",
            successfully = "",
        },
        -- 用于显示进度的图标
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        -- 进度条的刷新时间
        refresh_rate_ms = 100,
    },

    -- 运行器配置
    runner = {
        -- 选择哪个作为后端
        type = "toggleterm", ---@type "toggleterm"|"terminal"|"quickfix"|"snacks"

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
            snacks = {
                position = "float",
                interactive = true,
            },
        },
    },
    -- 执行器配置
    execute = {
        -- 选择哪个作为后端
        type = "quickfix", ---@type "toggleterm"|"terminal"|"quickfix"|"snacks"

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
            snacks = {
                position = "float",
                interactive = true,
            },
        },
    },

    -- 开启开发模式
    dev_debug = false,
})
```

</details>

## ✨ 和其它插件一起使用

和`lualine.nvim`等状态线插件使用，这里提供`lualine.nvim`的示例

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

## 🎉 其他项目

- [Civitasv/cmake-tool.nvim](https://github.com/Civitasv/cmake-tools.nvim) 非常感谢该项目提供的想法
