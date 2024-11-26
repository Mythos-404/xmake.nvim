---@meta
---[custom_toolchain](https://xmake.io/#/zh-cn/manual/custom_toolchain)

---
---定义工具链与交叉工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchain)
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function toolchain(name, scope) end

---
---**范围: toolchain**
---
---设置工具链类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchainset_kind)
---
---@param kind string|"standalone"
---@return nil
function set_kind(kind) end

---
---**范围: toolchain**
---
---设置工具集
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchainset_toolset)
---
---@param tool ToolsetNames
---@param path string
---@param ... string
---@return nil
function set_toolset(tool, path, ...) end

---
---**范围: toolchain**
---
---设置工具链sdk目录路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchainset_sdkdir)
---
---@param dir string
---@return nil
function set_sdkdir(dir) end

---
---**范围: toolchain**
---
---设置工具链bin目录路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchainset_bindir)
---
---@param dir string
---@return nil
function set_bindir(dir) end

---
---**范围: toolchain**
---
---检测工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchainon_check)
---
---@param func fun(toolchain: Toolchainon): nil
---@return nil
function on_check(func) end

---
---**范围: toolchain**
---
---加载工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchainon_load)
---
---@param func fun(toolchain: Toolchainon): nil
---@return nil
function on_load(func) end

---
---结束定义工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_toolchain?id=toolchain_end)
---
---@return nil
function toolchain_end() end
