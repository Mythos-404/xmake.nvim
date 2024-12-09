---@meta
---[xpack](https://xmake.io/#/manual/xpack)

---
---Defining XPack
---
---@param name string
---@param scope? ScopeSyntax Scope syntax
---@return nil
function xpack(name, scope) end

---
---**Scoped: xpack**
---
---Set package version
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_version)
---
---@param version string
---@return nil
function set_version(version) end

---
---**Scoped: xpack**
---
---Set homepage information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_homepage)
---
---@param url string
---@return nil
function set_homepage(url) end

---
---**Scoped: xpack**
---
---Set title information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_title)
---
---@param title string
---@return nil
function set_title(title) end

---
---**Scoped: xpack**
---
---Set detailed description
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_description)
---
---@param description string
---@return nil
function set_description(description) end

---
---**Scoped: xpack**
---
---Set author information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_author)
---
---@param author string
---@return nil
function set_author(author) end

---
---**Scoped: xpack**
---
---Set maintainer information
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_maintainer)
---
---@param maintainer string
---@return nil
function set_maintainer(maintainer) end

---
---**Scoped: xpack**
---
---Set the copyright information of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_copyright)
---
---@param copyright string
---@return nil
function set_copyright(copyright) end

---
---**Scoped: xpack**
---
---Set the package licence
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_license)
---
---@param license string
---@return nil
function set_license(license) end

---
---**Scoped: xpack**
---
---Set the license file of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_licensefile)
---
---@param file string
---@return nil
function set_licensefile(file) end

---
---**Scoped: xpack**
---
---Set the company to which the package belongs
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_company)
---
---@param company string
---@return nil
function set_company(company) end

---
---**Scoped: xpack**
---
---Set the packaged input source type
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_inputkind)
---
---@param kind "binary"|"source"
---@return nil
function set_inputkind(kind) end

---
---**Scoped: xpack**
---
---Set packaging format
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_formats)
---
---@param format XPackFormats
---@param ... XPackFormats
---@return nil
function set_formats(format, ...) end

---
---**Scoped: xpack**
---
---Set package file name
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_basename)
---
---@param name string
---@return nil
function set_basename(name) end

---
---**Scoped: xpack**
---
---Set the extension of the installation package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_extension)
---
---@param ext string
---@return nil
function set_extension(ext) end

---
---**Scoped: xpack**
---
---Associated target program
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_targets)
---
---@param target string
---@param ... string
---@return nil
function add_targets(target, ...) end

---
---**Scoped: xpack**
---
---Add installation package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_components)
---
---@param component string
---@param ... string
---@return nil
function add_components(component, ...) end

---
---**Scoped: xpack**
---
---Set the binary installation directory of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_bindir)
---
---@param dir string
---@return nil
function set_bindir(dir) end

---
---**Scoped: xpack**
---
---Set the library installation directory of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_libdir)
---
---@param dir string
---@return nil
function set_libdir(dir) end

---
---**Scoped: xpack**
---
---Set the package header file installation directory
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_includedir)
---
---@param dir string
---@return nil
function set_includedir(dir) end

---
---**Scoped: xpack**
---
---Set the installation prefix directory of the package
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_prefixdir)
---
---@param dir string
---@return nil
function set_prefixdir(dir) end

---
---**Scoped: xpack**
---
---Set package spec file path
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_specfile)
---
---@param flie string
---@return nil
function set_specfile(flie) end

---
---**Scoped: xpack**
---
---Set custom variables in the package spec file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_specvar)
---
---@param key string
---@param value any
---@return nil
function set_specvar(key, value) end

---
---**Scoped: xpack**
---
---Set icon file path
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_iconfile)
---
---@param file string
---@return nil
function set_iconfile(file) end

---
---**Scoped: xpack**
---
---Add source files
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_sourcefiles)
---
---@param file string
---@param ... string
---@return nil
function add_sourcefiles(file, ...) end

---
---**Scoped: xpack**
---
---Add source files
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_sourcefiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_sourcefiles(file, opts) end

---
---**Scoped: xpack**
---
---Add binary files
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_installfiles)
---
---@param file string
---@param ... string
---@return nil
function add_installfiles(file, ...) end

---
---**Scoped: xpack**
---
---Add binary files
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_installfiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_installfiles(file, opts) end

---
---**Scoped: xpack**
---
---Add package build dependencies
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackadd_buildrequires)
---
---@param pack string
---@param ... string
---@return nil
function add_buildrequires(pack, ...) end

---
---**Scoped: xpack**
---
---Custom loading script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_load)
---
---@param func XPackHook
---@return nil
function on_load(func) end

---
---**Scoped: xpack**
---
---Customize the script before packaging
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_package)
---
---@param func XPackHook
---@return nil
function before_package(func) end

---
---**Scoped: xpack**
---
---Custom packaging script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_package)
---
---@param func XPackHook
---@return nil
function on_package(func) end

---
---**Scoped: xpack**
---
---Customize the script after packaging
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_package)
---
---@param func XPackHook
---@return nil
function after_package(func) end

---
---**Scoped: xpack**
---
---Add script before installation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_installcmd)
---
---@param func XPackcmdHook
---@return nil
function before_installcmd(func) end

---
---**Scoped: xpack**
---
---Custom build script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_buildcmd)
---
---@param func XPackcmdHook
---@return nil
function on_buildcmd(func) end

---
---**Scoped: xpack**
---
---Customize pre-build scripts
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_buildcmd)
---
---@param func XPackcmdHook
---@return nil
function before_buildcmd(func) end

---
---**Scoped: xpack**
---
---Customize the script after the build
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_buildcmd)
---
---@param func XPackcmdHook
---@return nil
function after_buildcmd(func) end

---
---**Scoped: xpack**
---
---Custom installation script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_installcmd)
---
---@param func XPackcmdHook
---@return nil
function on_installcmd(func) end

---
---**Scoped: xpack**
---
---Add post-installation scripts
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_installcmd)
---
---@param func XPackcmdHook
---@return nil
function after_installcmd(func) end

---
---**Scoped: xpack**
---
---Add script before uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackbefore_uninstallcmd)
---
---@param func XPackcmdHook
---@return nil
function before_uninstallcmd(func) end

---
---**Scoped: xpack**
---
---Custom uninstall script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackon_uninstallcmd)
---
---@param func XPackcmdHook
---@return nil
function on_uninstallcmd(func) end

---
---**Scoped: xpack**
---
---Add script after uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackafter_uninstallcmd)
---
---@param func XPackcmdHook
---@return nil
function after_uninstallcmd(func) end

---
---**Scoped: xpack**
---
---Set the display icon of NSIS
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpackset_nsis_displayicon)
---
---@param icon string
---@return nil
function set_nsis_displayicon(icon) end

---
---Defining XPack component
---
---@param name string
---@param scope? ScopeSyntax Scope syntax
---@return nil
function xpack_component(name, scope) end

---
---**Scoped: xpack_component**
---
---Set a brief description of the package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentset_title)
---
---@param title string
---@return nil
function set_title(title) end

---
---**Scoped: xpack_component**
---
---Set detailed description of package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentset_description)
---
---@param description string
---@return nil
function set_description(description) end

---
---**Scoped: xpack_component**
---
---Set the default enabled state of package components
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentset_default)
---
---@param enable boolean
---@return nil
function set_default(enable) end

---
---**Scoped: xpack_component**
---
---Custom loading script
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componenton_load)
---
---@param func XPackHook
---@return nil
function on_load(func) end

---
---**Scoped: xpack_component**
---
---Add script before component installation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentbefore_installcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function before_installcmd(func) end

---
---**Scoped: xpack_component**
---
---Rewrite the installation script of the component
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componenton_installcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function on_installcmd(func) end

---
---**Scoped: xpack_component**
---
---Add script after component installation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentafter_installcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function after_installcmd(func) end

---
---**Scoped: xpack_component**
---
---Add script before component uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentbefore_uninstallcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function before_uninstallcmd(func) end

---
---**Scoped: xpack_component**
---
---Rewrite the script for component uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componenton_uninstallcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function on_uninstallcmd(func) end

---
---**Scoped: xpack_component**
---
---Add script after component uninstallation
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentafter_uninstallcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function after_uninstallcmd(func) end

---
---**Scoped: xpack_component**
---
---Add component source file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentadd_sourcefiles)
---
---@param file string
---@param ... string
---@return nil
function add_sourcefiles(file, ...) end

---
---**Scoped: xpack_component**
---
---Add component source file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentadd_sourcefiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_sourcefiles(file, opts) end

---
---**Scoped: xpack_component**
---
---Add component binary installation file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentadd_installfiles)
---
---@param file string
---@param ... string
---@return nil
function add_installfiles(file, ...) end

---
---**Scoped: xpack_component**
---
---Add component binary installation file
---
---[Open in browser](https://xmake.io/#/manual/xpack?id=xpack_componentadd_installfiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_installfiles(file, opts) end
