---
name: 错误报告
about: 创建一个中文错误报告模板(请注意标题请使用英语)
title: "[BUG] 为问题标题添加占位符"
labels: bug
assignees: ""
---

**错误描述**
请描述你的错误信息

**重现方法**
......

**截图(可选)**

**环境信息**

- 系统: [e.g. ArchLinux]
- Shell: [e.g. Zsh-5.9]
- 终端: [e.g. Kitty]
- Neovim版本: [e.g. v0.10.0-dev-1055+gb7734c4ec] # 请使用 `neovim --version` 获取
- Xmake版本: [e.g. v2.8.2+HEAD.57212c681] # 请使用 `xmake --version` 获取
- 本插件的版本: [e.g. 54d7b36] # 请使用 `:Lazy log xmake.nvim` 获取第一个哈希

**最低可复现配置**非常重要

一个简单示例

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "git@github.com:folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "Mythos-404/xmake.nvim",
        lazy = true,
        version = "^3",
        event = "BufReadPost xmake.lua",
        config = true,
    }
})
```
