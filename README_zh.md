**| [English](README.md) | 简体中文 |**

<h1 align="center">
    Xmake.nvim
</h1>

## 🎐 特征

1. 提供UI界面让你可以快速进行xmake配置、编译、清理
2. 在保存`xmake.lua`文件时自动生成*clangd*使用的`compile_commands.json`
3. 所有外部命令调用采用异步的方式执行无需担心性能问题

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

<details> <summary>Gif 预览</summary>

![XmakePreviewGif](./assets/XmakePreview.gif)

</details>

# 🏗 安装

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

## ⚙️ 默认设置

```lua
{
    compile_commands_dir = ".vscode",
}
```

## 💡 命令

1. `XmakeSetMenu` 总选择页面
2. `XmakeSetToolchain` 工具链选择
3. `XmakeSetMode` 编译模式选择
4. `XmakeSetTarget` 目标选择
5. `XmakeSetPlat` 目标平台选择
6. `XmakeSetArch` 目标架构选择
7. `XmakeBuild` 编译目标
8. `XmakeBuildAll` 编译全部目标
9. `XmakeBuildTarget` 编译指定目标
10. `XmakeClean` 清理目标
11. `XmakeCleanAll` 清理全部目标
12. `XmakeCleanTarget` 清理指定目标

## ✨ 和其它插件一起使用

和`nvim-dap`一起使用可以获取目标的编译输出路径

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

和`lualine.nvim`等状态线插件使用，这里只放出`lualine.nvim`的示例

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

- [ ] 运行功能(在UI中)
  - [ ] 运行目标
  - [ ] 运行多个目标
  - [ ] 运行时可以输入
  - [ ] 监控运行是否成功

## 🎉 其他类似项目

- [CnsMaple/xmake.nvim](https://github.com/CnsMaple/xmake.nvimjk)
