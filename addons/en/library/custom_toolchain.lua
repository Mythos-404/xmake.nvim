---@meta
---[custom_toolchain](https://xmake.io/#/manual/custom_toolchain)

---
---Define toolchain or cross toolchain
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchain)
---
---@param name string
---@param scope? ScopeSyntax Scope syntax
---@return nil
function toolchain(name, scope) end

---
---**Scoped: toolchain**
---
---Set toolchain type
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchainset_kind)
---
---@param kind string|"standalone"
---@return nil
function set_kind(kind) end

---
---**Scoped: toolchain**
---
---Set Tool Set
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchainset_toolset)
---
---@param tool ToolsetNames
---@param path string
---@param ... string
---@return nil
function set_toolset(tool, path, ...) end

---
---**Scoped: toolchain**
---
---Set toolchain sdk directory path
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchainset_sdkdir)
---
---@param dir string
---@return nil
function set_sdkdir(dir) end

---
---**Scoped: toolchain**
---
---Set toolchain bin directory path
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchainset_bindir)
---
---@param dir string
---@return nil
function set_bindir(dir) end

---
---**Scoped: toolchain**
---
---Detection toolchain
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchainon_check)
---
---@param func fun(toolchain: Toolchainon): nil
---@return nil
function on_check(func) end

---
---**Scoped: toolchain**
---
---Load toolchain
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchainon_load)
---
---@param func fun(toolchain: Toolchainon): nil
---@return nil
function on_load(func) end

---
---End definition toolchain
---
---[Open in browser](https://xmake.io/#/manual/custom_toolchain?id=toolchain_end)
---
---@return nil
function toolchain_end() end
