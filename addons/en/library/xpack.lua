---@meta
---[xpack](https://xmake.io/#/manual/xpack)

---
---**Scoped: xpack**
---
---Set package version
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_version)
---
---@param
---@return
function set_version() end
                    
---
---**Scoped: xpack**
---
---Set homepage information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_homepage)
---
---@param
---@return
function set_homepage() end
                    
---
---**Scoped: xpack**
---
---Set title information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_title)
---
---@param
---@return
function set_title() end
                    
---
---**Scoped: xpack**
---
---Set detailed description
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_description)
---
---@param
---@return
function set_description() end
                    
---
---**Scoped: xpack**
---
---Set author information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_author)
---
---@param
---@return
function set_author() end
                    
---
---**Scoped: xpack**
---
---Set maintainer information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_maintainer)
---
---@param
---@return
function set_maintainer() end
                    
---
---**Scoped: xpack**
---
---Set the copyright information of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_copyright)
---
---@param
---@return
function set_copyright() end
                    
---
---**Scoped: xpack**
---
---Set the package licence
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_license)
---
---@param
---@return
function set_license() end
                    
---
---**Scoped: xpack**
---
---Set the license file of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_licensefile)
---
---@param
---@return
function set_licensefile() end
                    
---
---**Scoped: xpack**
---
---Set the company to which the package belongs
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_company)
---
---@param
---@return
function set_company() end
                    
---
---**Scoped: xpack**
---
---Set the packaged input source type
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_inputkind)
---
---@param
---@return
function set_inputkind() end
                    
---
---**Scoped: xpack**
---
---Set packaging format
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_formats)
---
---@param
---@return
function set_formats() end
                    
---
---**Scoped: xpack**
---
---Set package file name
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_basename)
---
---@param
---@return
function set_basename() end
                    
---
---**Scoped: xpack**
---
---Set the extension of the installation package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_extension)
---
---@param
---@return
function set_extension() end
                    
---
---**Scoped: xpack**
---
---Associated target program
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_targets)
---
---@param
---@return
function add_targets() end
                    
---
---**Scoped: xpack**
---
---Add installation package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_components)
---
---@param
---@return
function add_components() end
                    
---
---**Scoped: xpack**
---
---Set the binary installation directory of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_bindir)
---
---@param
---@return
function set_bindir() end
                    
---
---**Scoped: xpack**
---
---Set the library installation directory of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_libdir)
---
---@param
---@return
function set_libdir() end
                    
---
---**Scoped: xpack**
---
---Set the package header file installation directory
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_includedir)
---
---@param
---@return
function set_includedir() end
                    
---
---**Scoped: xpack**
---
---Set the installation prefix directory of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_prefixdir)
---
---@param
---@return
function set_prefixdir() end
                    
---
---**Scoped: xpack**
---
---Set package spec file path
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_specfile)
---
---@param
---@return
function set_specfile() end
                    
---
---**Scoped: xpack**
---
---Set custom variables in the package spec file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_specvar)
---
---@param
---@return
function set_specvar() end
                    
---
---**Scoped: xpack**
---
---Set icon file path
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_iconfile)
---
---@param
---@return
function set_iconfile() end
                    
---
---**Scoped: xpack**
---
---Add source files
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_sourcefiles)
---
---@param
---@return
function add_sourcefiles() end
                    
---
---**Scoped: xpack**
---
---Add binary files
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_installfiles)
---
---@param
---@return
function add_installfiles() end
                    
---
---**Scoped: xpack**
---
---Add package build dependencies
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_buildrequires)
---
---@param
---@return
function add_buildrequires() end
                    
---
---**Scoped: xpack**
---
---Custom loading script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_load)
---
---@param
---@return
function on_load() end
                    
---
---**Scoped: xpack**
---
---Customize the script before packaging
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_package)
---
---@param
---@return
function before_package() end
                    
---
---**Scoped: xpack**
---
---Custom packaging script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_package)
---
---@param
---@return
function on_package() end
                    
---
---**Scoped: xpack**
---
---Customize the script after packaging
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_package)
---
---@param
---@return
function after_package() end
                    
---
---**Scoped: xpack**
---
---Custom build script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_buildcmd)
---
---@param
---@return
function on_buildcmd() end
                    
---
---**Scoped: xpack**
---
---Customize pre-build scripts
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_buildcmd)
---
---@param
---@return
function before_buildcmd() end
                    
---
---**Scoped: xpack**
---
---Customize the script after the build
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_buildcmd)
---
---@param
---@return
function after_buildcmd() end
                    
---
---**Scoped: xpack**
---
---Add script before installation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_installcmd)
---
---@param
---@return
function before_installcmd() end
                    
---
---**Scoped: xpack**
---
---Custom installation script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_installcmd)
---
---@param
---@return
function on_installcmd() end
                    
---
---**Scoped: xpack**
---
---Add post-installation scripts
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_installcmd)
---
---@param
---@return
function after_installcmd() end
                    
---
---**Scoped: xpack**
---
---Add script before uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_uninstallcmd)
---
---@param
---@return
function before_uninstallcmd() end
                    
---
---**Scoped: xpack**
---
---Custom uninstall script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_uninstallcmd)
---
---@param
---@return
function on_uninstallcmd() end
                    
---
---**Scoped: xpack**
---
---Add script after uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_uninstallcmd)
---
---@param
---@return
function after_uninstallcmd() end
                    
---
---**Scoped: xpack**
---
---Set the display icon of NSIS
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_nsis_displayicon)
---
---@param
---@return
function set_nsis_displayicon() end
                    
---
---**Scoped: xpack_component**
---
---Set a brief description of the package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentset_title)
---
---@param
---@return
function set_title() end
                    
---
---**Scoped: xpack_component**
---
---Set detailed description of package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentset_description)
---
---@param
---@return
function set_description() end
                    
---
---**Scoped: xpack_component**
---
---Set the default enabled state of package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentset_default)
---
---@param
---@return
function set_default() end
                    
---
---**Scoped: xpack_component**
---
---Custom loading script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componenton_load)
---
---@param
---@return
function on_load() end
                    
---
---**Scoped: xpack_component**
---
---Add script before component installation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentbefore_installcmd)
---
---@param
---@return
function before_installcmd() end
                    
---
---**Scoped: xpack_component**
---
---Rewrite the installation script of the component
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componenton_installcmd)
---
---@param
---@return
function on_installcmd() end
                    
---
---**Scoped: xpack_component**
---
---Add script after component installation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentafter_installcmd)
---
---@param
---@return
function after_installcmd() end
                    
---
---**Scoped: xpack_component**
---
---Add script before component uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentbefore_uninstallcmd)
---
---@param
---@return
function before_uninstallcmd() end
                    
---
---**Scoped: xpack_component**
---
---Rewrite the script for component uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componenton_uninstallcmd)
---
---@param
---@return
function on_uninstallcmd() end
                    
---
---**Scoped: xpack_component**
---
---Add script after component uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentafter_uninstallcmd)
---
---@param
---@return
function after_uninstallcmd() end
                    
---
---**Scoped: xpack_component**
---
---Add component source file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentadd_sourcefiles)
---
---@param
---@return
function add_sourcefiles() end
                    
---
---**Scoped: xpack_component**
---
---Add component binary installation file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentadd_installfiles)
---
---@param
---@return
function add_installfiles() end
                    