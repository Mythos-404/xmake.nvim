---@meta
---[package_dependencies](https://xmake.io/#/zh-cn/manual/package_dependencies)

---
---仓库依赖包定义描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=package)
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function package(name, scope) end

---
---**范围: package**
---
---设置包所在项目的官方页面地址
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageset_homepage)
---
---@param link string
---@return nil
function set_homepage(link) end

---
---**范围: package**
---
---设置包的相关描述信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageset_description)
---
---@param description string
---@return nil
function set_description(description) end

---
---**范围: package**
---
---设置包类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageset_kind)
---
---@param kind PackageKind
---@return nil
function set_kind(kind) end

---
---**范围: package**
---
---设置包源地址
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageset_urls)
---
---@param url string
---@param opts? PackageUrlOpts
---@return nil
function set_urls(url, opts) end

---
---**范围: package**
---
---添加包源地址
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_urls)
---
---@param url string
---@param opts? PackageUrlOpts
---@return nil
function add_urls(url, opts) end

---
---**范围: package**
---
---添加包源地址
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_urls)
---
---@param url string
---@param ... string
---@return nil
function add_urls(url, ...) end

---
---**范围: package**
---
---设置每个源码包的版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_versions)
---
---@param version string
---@param sha256 string
---@return nil
function add_versions(version, sha256) end

---
---**范围: package**
---
---添加包版本列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_versionfiles)
---
---@param filepath string
---@return nil
function add_versionfiles(filepath) end

---
---**范围: package**
---
---设置包补丁
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_patches)
---
---@param version string
---@param patch string
---@param sha256 string
---@return nil
function add_patches(version, patch, sha256) end

---
---**范围: package**
---
---设置库链接
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_links)
---
---@param link string
---@param ... string
---@return nil
function add_links(link, ...) end

---
---**范围: package**
---
---设置系统库链接
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_syslinks)
---
---@param link string
---@param ... string
---@return nil
function add_syslinks(link, ...) end

---
---**范围: package**
---
---调整包内部的链接顺序
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_linkorders)
---
---@param link string
---@param ... string
---@return nil
function add_linkorders(link, ...) end

---
---**范围: package**
---
---配置包的链接组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_linkgroups)
---
---@param link string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link, opts) end

---
---**范围: package**
---
---配置包的链接组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_linkgroups)
---
---@param link1 string
---@param link2 string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link1, link2, opts) end

---
---**范围: package**
---
---添加依赖的系统 frameworks 链接
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_frameworks)
---
---@param framework string
---@param ... string
---@return nil
function add_frameworks(framework, ...) end

---
---**范围: package**
---
---添加链接目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_linkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_linkdirs(dir, ...) end

---
---**范围: package**
---
---添加其他头文件搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_includedirs)
---
---@param dir string
---@param ... string
---@return nil
function add_includedirs(dir, ...) end

---
---**范围: package**
---
---添加可执行文件目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_bindirs)
---
---@param dir string
---@param ... string
---@return nil
function add_bindirs(dir, ...) end

---
---**范围: package**
---
---添加宏定义
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_defines)
---
---@param def string
---@param ... string
---@return nil
function add_defines(def, ...) end

---
---**范围: package**
---
---添加包配置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_configs)
---
---@param name string
---@param def any
---@return nil
function add_configs(name, def) end

---
---**范围: package**
---
---添加扩展的包源
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_extsources)
---
---@param source string
---@param ... string
---@return nil
function add_extsources(source, ...) end

---
---**范围: package**
---
---添加包依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_deps)
---
---@param dep string
---@param ... string
---@return nil
function add_deps(dep, ...) end

---
---**范围: package**
---
---添加包组件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageadd_components)
---
---@param component string
---@param ... string
---@return nil
function add_components(component, ...) end

---
---**范围: package**
---
---继承包配置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageset_base)
---
---@param name string
---@return nil
function set_base(name) end

---
---**范围: package**
---
---加载包配置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_load)
---
---@param func PackageHook
---@return nil
function on_load(func) end

---
---**范围: package**
---
---从系统中查找库
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_fetch)
---
---@param os OperationSystem
---@param func PackageOptsHook
---@return nil
function on_fetch(os, func) end

---
---**范围: package**
---
---检测包是否支持当前平台
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_check)
---
---@param func PackageHook
---@return nil
function on_check(func) end

---
---**范围: package**
---
---检测包是否支持当前平台
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_check)
---
---@param plat Platform
---@param func PackageHook
---@return nil
function on_check(plat, func) end

---
---**范围: package**
---
---安装包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_install)
---
---@param func PackageHook
---@return nil
function on_install(func) end

---
---**范围: package**
---
---安装包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_install)
---
---@param plat Platform
---@param func PackageHook
---@return nil
function on_install(plat, func) end

---
---**范围: package**
---
---测试包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_test)
---
---@param func PackageHook
---@return nil
function on_test(func) end

---
---**范围: package**
---
---自定义下载包
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_download)
---
---@param func PackageDownloadHook
---@return nil
function on_download(func) end

---
---**范围: package**
---
---配置包组件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/package_dependencies?id=packageon_component)
---
---@param component string
---@param func PackageComponentHook
---@return nil
function on_component(component, func) end
