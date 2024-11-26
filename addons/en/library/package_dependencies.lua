---@meta
---[package_dependencies](https://xmake.io/#/manual/package_dependencies)

---
---Define package configuration
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=package)
---
---@param
---@return
function package() end
                    
---
---**Scoped: package**
---
---Set package homepage
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_homepage)
---
---@param
---@return
function set_homepage() end
                    
---
---**Scoped: package**
---
---Set package description
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_description)
---
---@param
---@return
function set_description() end
                    
---
---**Scoped: package**
---
---Set package kind
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_kind)
---
---@param
---@return
function set_kind() end
                    
---
---**Scoped: package**
---
---Set package urls
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_urls)
---
---@param
---@return
function set_urls() end
                    
---
---**Scoped: package**
---
---Add package urls
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_urls)
---
---@param
---@return
function add_urls() end
                    
---
---**Scoped: package**
---
---Add package versions
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_versions)
---
---@param
---@return
function add_versions() end
                    
---
---**Scoped: package**
---
---Adding a list of package versions
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_versionfiles)
---
---@param
---@return
function add_versionfiles() end
                    
---
---**Scoped: package**
---
---Add package patches
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_patches)
---
---@param
---@return
function add_patches() end
                    
---
---**Scoped: package**
---
---Add package links
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_links)
---
---@param
---@return
function add_links() end
                    
---
---**Scoped: package**
---
---Add system library links
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_syslinks)
---
---@param
---@return
function add_syslinks() end
                    
---
---**Scoped: package**
---
---Adjust the link order within the package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkorders)
---
---@param
---@return
function add_linkorders() end
                    
---
---**Scoped: package**
---
---Configure the link group of the package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkgroups)
---
---@param
---@return
function add_linkgroups() end
                    
---
---**Scoped: package**
---
---Add frameworks
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_frameworks)
---
---@param
---@return
function add_frameworks() end
                    
---
---**Scoped: package**
---
---Add link directories
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_linkdirs)
---
---@param
---@return
function add_linkdirs() end
                    
---
---**Scoped: package**
---
---Add include directories
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_includedirs)
---
---@param
---@return
function add_includedirs() end
                    
---
---**Scoped: package**
---
---Add executable file directory
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_bindirs)
---
---@param
---@return
function add_bindirs() end
                    
---
---**Scoped: package**
---
---Add definition
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_defines)
---
---@param
---@return
function add_defines() end
                    
---
---**Scoped: package**
---
---Add package configs
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_configs)
---
---@param
---@return
function add_configs() end
                    
---
---**Scoped: package**
---
---Add external package sources
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_extsources)
---
---@param
---@return
function add_extsources() end
                    
---
---**Scoped: package**
---
---Add package dependencies
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageadd_deps)
---
---@param
---@return
function add_deps() end
                    
---
---**Scoped: packages**
---
---Add package components
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packagesadd_components)
---
---@param
---@return
function add_components() end
                    
---
---**Scoped: package**
---
---Inherit package configuration
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageset_base)
---
---@param
---@return
function set_base() end
                    
---
---**Scoped: package**
---
---Load package configuration
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_load)
---
---@param
---@return
function on_load() end
                    
---
---**Scoped: package**
---
---Fetch package libraries
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_fetch)
---
---@param
---@return
function on_fetch() end
                    
---
---**Scoped: package**
---
---Check whether the package supports the current platform
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_check)
---
---@param
---@return
function on_check() end
                    
---
---**Scoped: package**
---
---Installation package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_install)
---
---@param
---@return
function on_install() end
                    
---
---**Scoped: package**
---
---Custom download package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_download)
---
---@param
---@return
function on_download() end
                    
---
---**Scoped: package**
---
---Test package
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_test)
---
---@param
---@return
function on_test() end
                    
---
---**Scoped: package**
---
---Define package component
---
---[Open in browser](https://xmake.io/#/manual/package_dependencies?id=packageon_component)
---
---@param
---@return
function on_component() end
                    