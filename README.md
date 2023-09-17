<p align="right"><b>| English | <a href="README_zh.md">简体中文</a> |</b></p>

<h1 align="center">
    Xmake.nvim
</h1>

## 🎐 Features

1. Offer a UI interface for quickly configuring, building, and cleaning with xmake.
2. Automatically generate `compile_commands.json` used by _clangd_ when saving the `xmake.lua` file.
3. All external command invocations are performed asynchronously, eliminating concerns about performance issues.

<table>
  <tr>
    <th>Set Menu</th>
    <th>Set Toolchain</th>
  </tr>
  <tr>
    <td>
      <img src="./assets/XmakeSetMenu.png" />
    </td>
    <td>
      <img src="./assets/XmakeSetToolchain.png" />
    </td>
  </tr>
  <tr>
    <th>Set Build Mode</th>
    <th>Build Target</th>
  </tr>
  <tr>
    <td>
      <img src="./assets/XmakeSetMode.png" />
    </td>
    <td>
      <img src="./assets/XmakeBuildTarget.png" />
    </td>
  </tr>
</table>

<details> <summary>Gif Preview</summary>

![XmakePreviewGif](./assets/XmakePreview.gif)

</details>

# 🏗 Installation

### [💤lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "Mythos-404/xmake.nvim"
    lazy = true,
    event = "BufReadPost xmake.lua",
    config = true,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
}
```

## ⚙️ Default Configuration

```lua
{
    compile_commands_dir = ".vscode",
}
```

## 💡 Commands

1. `XmakeSetMenu` Overall selection menu
2. `XmakeSetToolchain` Toolchain selection
3. `XmakeSetMode` Compilation mode selection
4. `XmakeSetTarget` Target selection
5. `XmakeSetPlat` Target platform selection
6. `XmakeSetArch` Target architecture selection
7. `XmakeBuild` Build target
8. `XmakeBuildAll` Build all targets
9. `XmakeBuildTarget` Build specified target
10. `XmakeClean` Clean target
11. `XmakeCleanAll` Clean all targets
12. `XmakeCleanTarget` Clean specified target

## ✨ Using With Other Plugins

You can leverage the use of nvim-dap to obtain the compilation output path of the target:

```lua
dap.configurations.cpp = {
     {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return require("xmake.util").get_exec_path()
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
```

Using with status line plugins like lualine.nvim, here's an example specifically for lualine.nvim:

```lua
local xmake_component = {
    function()
        local xmake = require("xmake").config
        if xmake.target == "" then
            return ""
        end
        return xmake.target .. "(" .. xmake.mode .. ")"
    end,
    color = utils.gen_hl("green", true, true),
    cond = function()
        return vim.o.columns > 100
    end,
    on_click = function()
        require("xmake.set").setting()
    end,
}

require("lualine").setup({
    sections = {
       lualine_y = {
            xmake_component
        }
    }
})
```

## Todo

- [ ] Run Functions(in UI)
  - [ ] Run Targets
  - [ ] Run multiple targets
  - [ ] You can input when running
  - [ ] Monitor the success of the run

## 🎉 Similar Projects

- [CnsMaple/xmake.nvim](https://github.com/CnsMaple/xmake.nvim)
