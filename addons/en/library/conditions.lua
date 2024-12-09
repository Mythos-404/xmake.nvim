---@meta
---[conditions](https://xmake.io/#/manual/conditions)

---
---Is the current compilation target system
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_os)
---
---@param os OperationSystem
---@param ... OperationSystem
---@return boolean
function is_os(os, ...) end

---
---Is the current compilation architecture
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_arch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function is_arch(arch, ...) end

---
---Is the current compilation platform
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_plat)
---
---@param plat Platform
---@param ... Platform
---@return boolean
function is_plat(plat, ...) end

---
---Is the current compilation host system
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_host)
---
---@param host Host
---@param ... Host
---@return boolean
function is_host(host, ...) end

---
---Determine the subsystem environment of the current host
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_subhost)
---
---@param subhost SubHost
---@param ... SubHost
---@return boolean
function is_subhost(subhost, ...) end

---
---Determine the architecture of the current host subsystem environment
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_subarch)
---
---@param subarch SubArch
---@param ... SubArch
---@return boolean
function is_subarch(subarch, ...) end

---
---Determines whether the current platform is cross-compiled or not.
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_cross)
---
---@return boolean
function is_cross() end

---
---Is the current compilation mode
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_mode)
---
---@param mode CompilationMode
---@param ... CompilationMode
---@return boolean
function is_mode(mode, ...) end

---
---Is the current target kind
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_kind)
---
---@param kind TargetKind
---@param ... TargetKind
---@return boolean
function is_kind(kind, ...) end

---
---Is the given config values?
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=is_config)
---
---@param option string
---@param value string
---@param ... string
---@return boolean
function is_config(option, value, ...) end

---
---Is the given configs enabled?
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=has_config)
---
---@param option string
---@param ... string
---@return boolean
function has_config(option, ...) end

---
---Is the given dependent package enabled?
---
---[Open in browser](https://xmake.io/#/manual/conditions?id=has_package)
---
---@param package string
---@param ... string
---@return boolean
function has_package(package, ...) end
