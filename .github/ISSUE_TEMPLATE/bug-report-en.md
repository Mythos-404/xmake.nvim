---
name: Bug Report
about: Create a report to help us improve
title: ":bug: Add a placeholder for issue title"
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
- neovim version: [e.g. v0.10.0-dev-1055+gb7734c4ec] # Please use `neovim --version` to get it.
- xmake version: [e.g. v2.8.2+HEAD.57212c681] # Please use `xmake --version` to get it.

**Minimum Reproducible Configuration**
Very important.
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
        "Mythos-404/xmake.nvim"
        lazy = true,
        event = "BufReadPost xmake.lua",
        config = true,
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    }
})
```
