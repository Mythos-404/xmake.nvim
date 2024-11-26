---@meta
---[package_instance](https://xmake.io/#/zh-cn/manual/package_instance)

---@class Package
local Package = {}

---
---获取包的名字
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagename)
---
---@return string
function Package:name() end

---
---获取包在描述域的配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageget)
---
---@param key string
---@return string
function Package:get(key) end

---
---设置包的配置值，（如果你想添加值可以用 Package:add()）。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageset)
---
---@param key string
---@param value string
---@return nil
function Package:set(key, value) end

---
---按名称添加到包的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageadd)
---
---@param key string
---@param value string
---@return nil
function Package:add(key, value) end

---
---获取包的许可证（同`package:get("license")`）
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagelicense)
---
---@return string
function Package:license() end

---
---获取包的描述（同`package:get("description")`）
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagedescription)
---
---@return string
function Package:description() end

---
---获取包的平台。 可以是以下任何一种：
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageplat)
---
---@return PackagePlatform
function Package:plat() end

---
---获取包的架构（例如 x86、x64、x86_64）
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagearch)
---
---@return Architecture
function Package:arch() end

---
---获取包的目标操作系统。 可以具有与 [package:plat](#packageplat) 相同的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagetargetos)
---
---@return PackagePlatform
function Package:targetos() end

---
---获取包的目标架构。 可以具有与 [package:arch](#packagearch) 相同的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagetargetarch)
---
---@return Architecture
function Package:targetarch() end

---
---当前平台是否是给定平台之一
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_plat)
---
---@param plat PackagePlatform
---@param ... PackagePlatform
---@return boolean
function Package:is_plat(plat, ...) end

---
---当前架构是否是给定架构之一
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_arch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function Package:is_arch(arch, ...) end

---
---当前目标操作系统是否是给定操作系统之一
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_targetos)
---
---@param plat PackagePlatform
---@param ... PackagePlatform
---@return boolean
function Package:is_targetos(plat, ...) end

---
---当前目标架构是否是给定架构之一
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_targetarch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function Package:is_targetarch(arch, ...) end

---
---获取包的别名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagealias)
---
---@return string
function Package:alias() end

---
---获取包的 urls 列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageurls)
---
---@return string[]
function Package:urls() end

---
---通过名称获取包的依赖项。 该名称需要是包的依赖项。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagedep)
---
---@param name string
---@return Package
function Package:dep(name) end

---
---获取包的所有依赖项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagedeps)
---
---@return { [string]: Package }
function Package:deps() end

---
---获取 URL 别名的 sha256 校验和
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagesourcehash)
---
---@param name string
---@return string
function Package:sourcehash(name) end

---
---获取包的类型。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagekind)
---
---@return PackageKind
function Package:kind() end

---
---包是否为二进制类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_binary)
---
---@return boolean
function Package:is_binary() end

---
---报是否为工具链类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_toolchain)
---
---@return boolean
function Package:is_toolchain() end

---
---包是否为库类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_library)
---
---@return boolean
function Package:is_library() end

---
---包是否由第三方包管理器提供（例如 brew、conan、vcpkg）
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_thirdparty)
---
---@return boolean
function Package:is_thirdparty() end

---
---包是否以调试模式构建（同`package:config("debug")`）
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_debug)
---
---@return boolean
function Package:is_debug() end

---
---当前平台和架构是否支持该包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_supported)
---
---@return boolean
function Package:is_supported() end

---
---包是否正在交叉编译
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageis_cross)
---
---@return boolean
function Package:is_cross() end

---
---获取包的缓存目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagecachedir)
---
---@return string
function Package:cachedir() end

---
---获取包的安装目录。 也可用于获取子目录。 如果给定的目录树不存在，它将被创建。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageinstalldir)
---
---@param ... string
---@return string
function Package:installdir(...) end

---
---获取包的xmake.lua所在目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagescriptdir)
---
---@return string
function Package:scriptdir() end

---
---获取包导出的环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageenvs)
---
---@return { [string]: string[] }
function Package:envs() end

---
---获取给定的环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagegetenv)
---
---@param name string
---@return string[]
function Package:getenv(name) end

---
---设置给定的环境变量。 覆盖变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagesetenv)
---
---@param name string
---@param value string
---@param ... string
---@return nil
function Package:setenv(name, value, ...) end

---
---将给定的值添加到环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageaddenv)
---
---@param name string
---@param value string
---@param ... string
---@return nil
function Package:addenv(name, value, ...) end

---
---获取包的所有版本列表。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageversions)
---
---@return string[]
function Package:versions() end

---
---获取包的版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageversion)
---
---@return Version
function Package:version() end

---
---以字符串形式获取包的版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageversion_str)
---
---@return string
function Package:version_str() end

---
---获取包的给定配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageconfig)
---
---@param key string
---@return string
function Package:config(key) end

---
---设置包的给定配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageconfig_set)
---
---@param key string
---@param value string
---@return nil
function Package:config_set(key, value) end

---
---获取包的所有配置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packageconfigs)
---
---@return PackageConfig
function Package:configs() end

---
---获取包的构建哈希
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagebuildhash)
---
---@return string
function Package:buildhash() end

---
---获取当前版本的所有补丁
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagepatches)
---
---@return PackagePatch[]
function Package:patches() end

---
---检测包是否具有给定的 C 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_cfuncs(name, opts) end

---
---检测包是否具有给定的 C 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cfuncs(name, ...) end

---
---检测包是否具有给定的 C++ 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cxxfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_cxxfuncs(name, opts) end

---
---检测包是否具有给定的 C++ 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cxxfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cxxfuncs(name, ...) end

---
---检测包是否具有给定的 C 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_ctypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_ctypes(name, opts) end

---
---检测包是否具有给定的 C 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_ctypes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_ctypes(name, ...) end

---
---检测包是否具有给定的 C++ 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cxxtypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_cxxtypes(name, opts) end

---
---检测包是否具有给定的 C++ 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cxxtypes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cxxtypes(name, ...) end

---
---检测包是否具有给定的 C 头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cincludes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cincludes(name, ...) end

---
---检测包是否具有给定的 C++ 头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagehas_cxxincludes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cxxincludes(name, ...) end

---
---检测是否可以编译和链接给定的 C 代码片段
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagecheck_csnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Package:check_csnippets(snippet, ...) end

---
---检测是否可以编译和链接给定的 C++ 代码片段
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagecheck_cxxsnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Package:check_cxxsnippets(snippet, ...) end

---
---检测是否可以编译和链接给定的 Fortran 代码片段
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_instance?id=packagecheck_fcsnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Package:check_fcsnippets(snippet, ...) end
