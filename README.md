# xmake.nvim

该插件使用`nui.nvim`来提供选择让你可以快速进行xmake配置、编译、清理

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

# 📦安装

[lazy.nvim](https://github.com/folke/lazy.nvim):


```lua
{
    "Mythos-404/xmake.nvim"
    lazy = true,
    event = "BufReadPost xmake.lua",
    dependencies = { "MunifTanjim/nui.nvim" },
}
```

## 命令

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


## 📦 其他类似项目

- [CnsMaple/xmake.nvim](https://github.com/CnsMaple/xmake.nvimjk)
