---
name: Bug Report
about: Create a report to help us improve
title: "[BUG] Add a placeholder for issue title"
labels: bug
assignees: ""
---

**Error Description**
Please describe your error message

**Method of reproduction**
......

**Screenshots (optional)**

**Environmental Information**

- System: [e.g. ArchLinux]
- Shell: [e.g. Zsh-5.9]
- Terminal: [e.g. Kitty]
- Neovim version: [e.g. v0.10.0-dev-1055+gb7734c4ec] # Please use `neovim --version` to get it.
- Xmake version: [e.g. v2.8.2+HEAD.57212c681] # Please use `xmake --version` to get it.
- Plugin version: [e.g. 54d7b36] # Please use neovim `:Lazy log xmake.nvim` to get first hash.

**Minimum Reproducible Configuration**Very important.

A simple example

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
