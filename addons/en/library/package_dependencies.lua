---@meta
---[package_dependencies](https://xmake.io/#/manual/package_dependencies)

---
---Define package configuration
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=package)
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function package(name, scope) end

---
---**Scoped: package**
---
---Set package homepage
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_homepage)
---
---@param link string
---@return nil
function set_homepage(link) end

---
---**Scoped: package**
---
---Set package description
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_description)
---
---@param description string
---@return nil
function set_description(description) end

---
---**Scoped: package**
---
---Set package kind
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_kind)
---
---@param kind PackageKind
---@return nil
function set_kind(kind) end

---
---**Scoped: package**
---
---Set package urls
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_urls)
---
---@param url string
---@param opts? PackageUrlOpts
---@return nil
function set_urls(url, opts) end

---
---**Scoped: package**
---
---Add package urls
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_urls)
---
---@param url string
---@param opts? PackageUrlOpts
---@return nil
function add_urls(url, opts) end

---
---**Scoped: package**
---
---Add package versions
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_versions)
---
---@param version string
---@param sha256 string
---@return nil
function add_versions(version, sha256) end

---
---**Scoped: package**
---
---Adding a list of package versions
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_versionfiles)
---
---@param filepath string
---@return nil
function add_versionfiles(filepath) end

---
---**Scoped: package**
---
---Add package patches
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_patches)
---
---@param version string
---@param patch string
---@param sha256 string
---@return nil
function add_patches(version, patch, sha256) end

---
---**Scoped: package**
---
---Add package links
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_links)
---
---@param link string
---@param ... string
---@return nil
function add_links(link, ...) end

---
---**Scoped: package**
---
---Add system library links
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_syslinks)
---
---@param link string
---@param ... string
---@return nil
function add_syslinks(link, ...) end

---
---**Scoped: package**
---
---Adjust the link order within the package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkorders)
---
---@param link string
---@param ... string
---@return nil
function add_linkorders(link, ...) end

---
---**Scoped: package**
---
---Configure the link group of the package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkgroups)
---
---@param link string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link, opts) end

---
---**Scoped: package**
---
---Configure the link group of the package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkgroups)
---
---@param link1 string
---@param link2 string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link1, link2, opts) end

---
---**Scoped: package**
---
---Add frameworks
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_frameworks)
---
---@param framework string
---@param ... string
---@return nil
function add_frameworks(framework, ...) end

---
---**Scoped: package**
---
---Add link directories
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_linkdirs(dir, ...) end

---
---**Scoped: package**
---
---Add include directories
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_includedirs)
---
---@param dir string
---@param ... string
---@return nil
function add_includedirs(dir, ...) end

---
---**Scoped: package**
---
---Add executable file directory
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_bindirs)
---
---@param dir string
---@param ... string
---@return nil
function add_bindirs(dir, ...) end

---
---**Scoped: package**
---
---Add definition
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_defines)
---
---@param def string
---@param ... string
---@return nil
function add_defines(def, ...) end

---
---**Scoped: package**
---
---Add package configs
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_configs)
---
---@param name string
---@param def any
---@return nil
function add_configs(name, def) end

---
---**Scoped: package**
---
---Add external package sources
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_extsources)
---
---@param source string
---@param ... string
---@return nil
function add_extsources(source, ...) end

---
---**Scoped: package**
---
---Add package dependencies
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_deps)
---
---@param dep string
---@param ... string
---@return nil
function add_deps(dep, ...) end

---
---**Scoped: packages**
---
---Add package components
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packagesadd_components)
---
---@param component string
---@param ... string
---@return nil
function add_components(component, ...) end

---
---**Scoped: package**
---
---Inherit package configuration
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_base)
---
---@param name string
---@return nil
function set_base(name) end

---
---**Scoped: package**
---
---Load package configuration
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_load)
---
---@param func PackageHook
---@return nil
function on_load(func) end

---
---**Scoped: package**
---
---Fetch package libraries
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_fetch)
---
---@param os OperationSystem
---@param func PackageOptsHook
---@return nil
function on_fetch(os, func) end

---
---**Scoped: package**
---
---Check whether the package supports the current platform
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_check)
---
---@param func PackageHook
---@return nil
function on_check(func) end

---
---**Scoped: package**
---
---Check whether the package supports the current platform
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_check)
---
---@param plat Platform
---@param func PackageHook
---@return nil
function on_check(plat, func) end

---
---**Scoped: package**
---
---Installation package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_install)
---
---@param func PackageHook
---@return nil
function on_install(func) end

---
---**Scoped: package**
---
---Installation package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_install)
---
---@param plat Platform
---@param func PackageHook
---@return nil
function on_install(plat, func) end

---
---**Scoped: package**
---
---Test package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_test)
---
---@param func PackageHook
---@return nil
function on_test(func) end

---
---**Scoped: package**
---
---Custom download package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_download)
---
---@param func PackageDownloadHook
---@return nil
function on_download(func) end

---
---**Scoped: package**
---
---Define package component
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_component)
---
---@param component string
---@param func PackageComponentHook
---@return nil
function on_component(component, func) end
