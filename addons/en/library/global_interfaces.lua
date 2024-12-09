---@meta
---[global_interfaces](https://xmake.io/#/manual/global_interfaces)

---
---Add sub-project files and directories
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=includes)
---
---@param subproject string 目录或文件或者模式匹配
---@return nil
function includes(subproject) end

---
---Set project name
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_project)
---
---@param name string
---@return nil
function set_project(name) end

---
---Set project version
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_version)
---
---@param version string
---@param extra? { build: string, soname: boolean|string } *build*: 以时间格式创建版本 *soname*: 版本兼容控制
---@return nil
function set_version(version, extra) end

---
---Set minimal xmake version
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_xmakever)
---
---@param version string
---@return nil
function set_xmakever(version) end

---
---Add module directories
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_moduledirs)
---
---@param dir string
---@param ... string
---@return nil
function add_moduledirs(dir, ...) end

---
---Add plugin directories
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_plugindirs)
---
---@param dir string
---@param ... string
---@return nil
function add_plugindirs(dir, ...) end

---
---Get the configuration value
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=get_config)
---
---@param option string
---@return string
function get_config(option) end

---
---Set the default configuration value
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_config)
---
---@param option string
---@param value string
---@return nil
function set_config(option, value) end

---
---Add the required dependency packages
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_requires)
---
---@param ... string
---@return nil
function add_requires(name, ...) end

---
---Add the required dependency packages
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_requires)
---
---@param name string
---@param opts? RequireOpts
---@return nil
function add_requires(name, opts) end

---
---Set the configuration of the specified dependent package
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_requireconfs)
---
---@param name string
---@param opts? RequireconfsOpts
---@return nil
function add_requireconfs(name, opts) end

---
---Add 3rd package repositories
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_repositories)
---
---@param repo string
---@param ... string
---@return nil
function add_repositories(repo, ...) end

---
---Add 3rd package repositories
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=add_repositories)
---
---@param repo string
---@param opts { rootdir: string } *rootdir*: Set search rootdir
---@return nil
function add_repositories(repo, opts) end

---
---Set the default compilation platform
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_defaultplat)
---
---@param plat Platform
---@return nil
function set_defaultplat(plat) end

---
---Set the default compilation architecture
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_defaultarchs)
---
---@param arch Architecture
---@param ... Architecture
---@return nil
function set_defaultarchs(arch, ...) end

---
---Set the default compilation mode
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_defaultmode)
---
---@param mode CompilationMode
---@return nil
function set_defaultmode(mode) end

---
---Set the list of platforms allowed to compile
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_allowedplats)
---
---@param plat Platform
---@param ... Platform
---@return nil
function set_allowedplats(plat, ...) end

---
---Set the platform architecture that allows compilation
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_allowedarchs)
---
---@param arch Architecture
---@param ... Architecture
---@return nil
function set_allowedarchs(arch, ...) end

---
---Set the list of allowed compilation modes
---
---[Open in browser](https://xmake.io/#/manual/global_interfaces?id=set_allowedmodes)
---
---@param mode CompilationMode
---@param ... CompilationMode
---@return nil
function set_allowedmodes(mode, ...) end
