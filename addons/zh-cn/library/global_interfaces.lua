---@meta
---[global_interfaces](https://xmake.io/#/zh-cn/manual/global_interfaces)

---
---添加子工程文件和目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=includes)
---
---@param subproject string 目录或文件或者模式匹配
---@return nil
function includes(subproject) end

---
---设置工程名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_project)
---
---@param name string
---@return nil
function set_project(name) end

---
---设置工程版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_version)
---
---@param version string
---@param extra? { build: string, soname: boolean|string } *build*: 以时间格式创建版本 *soname*: 版本兼容控制
---@return nil
function set_version(version, extra) end

---
---设置最小xmake版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_xmakever)
---
---@param version string
---@return nil
function set_xmakever(version) end

---
---添加模块目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_moduledirs)
---
---@param dir string
---@param ... string
---@return nil
function add_moduledirs(dir, ...) end

---
---添加插件目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_plugindirs)
---
---@param dir string
---@param ... string
---@return nil
function add_plugindirs(dir, ...) end

---
---获取给定的配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=get_config)
---
---@param option string
---@return string
function get_config(option) end

---
---设置给定的默认配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_config)
---
---@param option string
---@param value string
---@return nil
function set_config(option, value) end

---
---添加需要的依赖包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_requires)
---
---@param name string
---@param ... string
---@return nil
function add_requires(name, ...) end

---
---添加需要的依赖包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_requires)
---
---@param name string
---@param opts? RequireOpts
---@return nil
function add_requires(name, opts) end

---
---设置指定依赖包的配置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_requireconfs)
---
---@param name string
---@param opts? RequireconfsOpts
---@return nil
function add_requireconfs(name, opts) end

---
---添加依赖包仓库
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_repositories)
---
---@param repo string
---@param ... string
---@return nil
function add_repositories(repo, ...) end

---
---添加依赖包仓库
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=add_repositories)
---
---@param repo string
---@param opts { rootdir: string } *rootdir*: 设置搜索根目录
---@return nil
function add_repositories(repo, opts) end

---
---设置默认的编译平台
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_defaultplat)
---
---@param plat Platform
---@return nil
function set_defaultplat(plat) end

---
---设置默认的编译架构
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_defaultarchs)
---
---@param arch Architecture
---@param ... Architecture
---@return nil
function set_defaultarchs(arch, ...) end

---
---设置默认的编译模式
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_defaultmode)
---
---@param mode CompilationMode
---@return nil
function set_defaultmode(mode) end

---
---设置允许编译的平台列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_allowedplats)
---
---@param plat Platform
---@param ... Platform
---@return nil
function set_allowedplats(plat, ...) end

---
---设置允许编译的平台架构
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_allowedarchs)
---
---@param arch Architecture
---@param ... Architecture
---@return nil
function set_allowedarchs(arch, ...) end

---
---设置允许的编译模式列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/global_interfaces?id=set_allowedmodes)
---
---@param mode CompilationMode
---@param ... CompilationMode
---@return nil
function set_allowedmodes(mode, ...) end
