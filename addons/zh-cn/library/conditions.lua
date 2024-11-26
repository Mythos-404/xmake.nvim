---@meta
---[conditions](https://xmake.io/#/zh-cn/manual/conditions)

---
---判断当前构建目标的操作系统
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_os)
---
---@param os OperationSystem
---@param ... OperationSystem
---@return boolean
function is_os(os, ...) end

---
---判断当前编译架构
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_arch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function is_arch(arch, ...) end

---
---判断当前编译平台
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_plat)
---
---@param plat Platform
---@param ... Platform
---@return boolean
function is_plat(plat, ...) end

---
---判断当前主机环境的操作系统
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_host)
---
---@param host Host
---@param ... Host
---@return boolean
function is_host(host, ...) end

---
---判断当前主机的子系统环境
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_subhost)
---
---@param subhost SubHost
---@param ... SubHost
---@return boolean
function is_subhost(subhost, ...) end

---
---判断当前主机子系统环境下的架构
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_subarch)
---
---@param subarch SubArch
---@param ... SubArch
---@return boolean
function is_subarch(subarch, ...) end

---
---判断当前平台是否为交叉编译
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_cross)
---
---@return boolean
function is_cross() end

---
---判断当前编译模式
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_mode)
---
---@param mode CompilationMode
---@param ... CompilationMode
---@return boolean
function is_mode(mode, ...) end

---
---判断当前编译类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_kind)
---
---@param kind TargetKind
---@param ... TargetKind
---@return boolean
function is_kind(kind, ...) end

---
---判断指定配置是否为给定的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=is_config)
---
---@param option string
---@param value string
---@param ... string
---@return boolean
function is_config(option, value, ...) end

---
---判断配置是否启用或者存在
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=has_config)
---
---@param option string
---@param ... string
---@return boolean
function has_config(option, ...) end

---
---判断依赖包是否启用或者存在
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/conditions?id=has_package)
---
---@param package string
---@param ... string
---@return boolean
function has_package(package, ...) end
