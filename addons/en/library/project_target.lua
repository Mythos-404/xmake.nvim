---@meta
---[project_target](https://xmake.io/#/manual/project_target)

---
---Define a project target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=target)
---
---@param
---@return
function target() end
                    
---
---End target definition
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=target_end)
---
---@param
---@return
function target_end() end
                    
---
---**Scoped: target**
---
---Set target kind
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_kind)
---
---@param
---@return
function set_kind() end
                    
---
---**Scoped: target**
---
---Strip target symbols
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_strip)
---
---@param
---@return
function set_strip() end
                    
---
---**Scoped: target**
---
---Enable or disable target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_enabled)
---
---@param
---@return
function set_enabled() end
                    
---
---**Scoped: target**
---
---Mark as default target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_default)
---
---@param
---@return
function set_default() end
                    
---
---**Scoped: target**
---
---Set configuration options
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_options)
---
---@param
---@return
function set_options() end
                    
---
---**Scoped: target**
---
---Set symbol info
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_symbols)
---
---@param
---@return
function set_symbols() end
                    
---
---**Scoped: target**
---
---Set the base name of target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_basename)
---
---@param
---@return
function set_basename() end
                    
---
---**Scoped: target**
---
---Set the full name of target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_filename)
---
---@param
---@return
function set_filename() end
                    
---
---**Scoped: target**
---
---Set the leading name of the target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_prefixname)
---
---@param
---@return
function set_prefixname() end
                    
---
---**Scoped: target**
---
---Set the postname of the target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_suffixname)
---
---@param
---@return
function set_suffixname() end
                    
---
---**Scoped: target**
---
---Set the extension of the target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_extension)
---
---@param
---@return
function set_extension() end
                    
---
---**Scoped: target**
---
---Set compilation warning level
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_warnings)
---
---@param
---@return
function set_warnings() end
                    
---
---**Scoped: target**
---
---Set competition optimization level
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_optimize)
---
---@param
---@return
function set_optimize() end
                    
---
---**Scoped: target**
---
---Set source code language standards
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_languages)
---
---@param
---@return
function set_languages() end
                    
---
---**Scoped: target**
---
---Set float-point compilation mode
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_fpmodels)
---
---@param
---@return
function set_fpmodels() end
                    
---
---**Scoped: target**
---
---Set output directories for target files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_targetdir)
---
---@param
---@return
function set_targetdir() end
                    
---
---**Scoped: target**
---
---Set output directories for object files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_objectdir)
---
---@param
---@return
function set_objectdir() end
                    
---
---**Scoped: target**
---
---Set output directories for dependent files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_dependir)
---
---@param
---@return
function set_dependir() end
                    
---
---**Scoped: target**
---
---Add imports modules for the custom script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_imports)
---
---@param
---@return
function add_imports() end
                    
---
---**Scoped: target**
---
---Add custom compilation rule to target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_rules)
---
---@param
---@return
function add_rules() end
                    
---
---**Scoped: target**
---
---Run custom load target configuration script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_load)
---
---@param
---@return
function on_load() end
                    
---
---**Scoped: target**
---
---custom configuration script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_config)
---
---@param
---@return
function on_config() end
                    
---
---**Scoped: target**
---
---Run custom link target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_link)
---
---@param
---@return
function on_link() end
                    
---
---**Scoped: target**
---
---Run custom build target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build)
---
---@param
---@return
function on_build() end
                    
---
---**Scoped: target**
---
---Run custom build single file script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build_file)
---
---@param
---@return
function on_build_file() end
                    
---
---**Scoped: target**
---
---Run custom build files script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build_files)
---
---@param
---@return
function on_build_files() end
                    
---
---**Scoped: target**
---
---Run custom clean files script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_clean)
---
---@param
---@return
function on_clean() end
                    
---
---**Scoped: target**
---
---Run custom package target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_package)
---
---@param
---@return
function on_package() end
                    
---
---**Scoped: target**
---
---Run custom install target file script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_install)
---
---@param
---@return
function on_install() end
                    
---
---**Scoped: target**
---
---Run custom uninstall target file script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_uninstall)
---
---@param
---@return
function on_uninstall() end
                    
---
---**Scoped: target**
---
---Run custom run target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_run)
---
---@param
---@return
function on_run() end
                    
---
---**Scoped: target**
---
---Run custom script before linking target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_link)
---
---@param
---@return
function before_link() end
                    
---
---**Scoped: target**
---
---Run custom script before building target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_build)
---
---@param
---@return
function before_build() end
                    
---
---**Scoped: target**
---
---Run custom script before building single file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_build_file)
---
---@param
---@return
function before_build_file() end
                    
---
---**Scoped: target**
---
---Run custom script before building files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_build_files)
---
---@param
---@return
function before_build_files() end
                    
---
---**Scoped: target**
---
---Run custom script before cleaning target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_clean)
---
---@param
---@return
function before_clean() end
                    
---
---**Scoped: target**
---
---Run custom script before packaging target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_package)
---
---@param
---@return
function before_package() end
                    
---
---**Scoped: target**
---
---Run custom script before installing target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_install)
---
---@param
---@return
function before_install() end
                    
---
---**Scoped: target**
---
---Run custom script before uninstalling target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_uninstall)
---
---@param
---@return
function before_uninstall() end
                    
---
---**Scoped: target**
---
---Run custom script before running target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_run)
---
---@param
---@return
function before_run() end
                    
---
---**Scoped: target**
---
---Run custom script after linking target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_link)
---
---@param
---@return
function after_link() end
                    
---
---**Scoped: target**
---
---Run custom script after building target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_build)
---
---@param
---@return
function after_build() end
                    
---
---**Scoped: target**
---
---Run custom script after building single file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_build_file)
---
---@param
---@return
function after_build_file() end
                    
---
---**Scoped: target**
---
---Run custom script after building files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_build_files)
---
---@param
---@return
function after_build_files() end
                    
---
---**Scoped: target**
---
---Run custom script after cleaning target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_clean)
---
---@param
---@return
function after_clean() end
                    
---
---**Scoped: target**
---
---Run custom script after packaging target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_package)
---
---@param
---@return
function after_package() end
                    
---
---**Scoped: target**
---
---Run custom script after installing target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_install)
---
---@param
---@return
function after_install() end
                    
---
---**Scoped: target**
---
---Run custom script after uninstalling target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_uninstall)
---
---@param
---@return
function after_uninstall() end
                    
---
---**Scoped: target**
---
---Run custom script after running target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_run)
---
---@param
---@return
function after_run() end
                    
---
---**Scoped: target**
---
---Set pre-compiled c header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pcheader)
---
---@param
---@return
function set_pcheader() end
                    
---
---**Scoped: target**
---
---Set pre-compiled c++ header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pcxxheader)
---
---@param
---@return
function set_pcxxheader() end
                    
---
---**Scoped: target**
---
---Set pre-compiled objc header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pmheader)
---
---@param
---@return
function set_pmheader() end
                    
---
---**Scoped: target**
---
---Set pre-compiled objc++ header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pmxxheader)
---
---@param
---@return
function set_pmxxheader() end
                    
---
---**Scoped: target**
---
---Add target dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_deps)
---
---@param
---@return
function add_deps() end
                    
---
---**Scoped: target**
---
---Add link libraries
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_links)
---
---@param
---@return
function add_links() end
                    
---
---**Scoped: target**
---
---Add system link libraries
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_syslinks)
---
---@param
---@return
function add_syslinks() end
                    
---
---**Scoped: target**
---
---Adjust link order
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkorders)
---
---@param
---@return
function add_linkorders() end
                    
---
---**Scoped: target**
---
---Add link group
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkgroups)
---
---@param
---@return
function add_linkgroups() end
                    
---
---**Scoped: target**
---
---Add source files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_files)
---
---@param
---@return
function add_files() end
                    
---
---**Scoped: target**
---
---Remove source files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetremove_files)
---
---@param
---@return
function remove_files() end
                    
---
---**Scoped: target**
---
---Remove the specified file from the preceding list of header files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetremove_headerfiles)
---
---@param
---@return
function remove_headerfiles() end
                    
---
---**Scoped: target**
---
---Add link search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkdirs)
---
---@param
---@return
function add_linkdirs() end
                    
---
---**Scoped: target**
---
---Add load search directories for dynamic libraries
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_rpathdirs)
---
---@param
---@return
function add_rpathdirs() end
                    
---
---**Scoped: target**
---
---Add include search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_includedirs)
---
---@param
---@return
function add_includedirs() end
                    
---
---**Scoped: target**
---
---Add system header file search directory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_sysincludedirs)
---
---@param
---@return
function add_sysincludedirs() end
                    
---
---**Scoped: target**
---
---Add macro definition
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_defines)
---
---@param
---@return
function add_defines() end
                    
---
---**Scoped: target**
---
---Add macro undefinition
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_undefines)
---
---@param
---@return
function add_undefines() end
                    
---
---**Scoped: target**
---
---Add c compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cflags)
---
---@param
---@return
function add_cflags() end
                    
---
---**Scoped: target**
---
---Add c/c++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cxflags)
---
---@param
---@return
function add_cxflags() end
                    
---
---**Scoped: target**
---
---Add c++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cxxflags)
---
---@param
---@return
function add_cxxflags() end
                    
---
---**Scoped: target**
---
---Add objc compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mflags)
---
---@param
---@return
function add_mflags() end
                    
---
---**Scoped: target**
---
---Add objc/objc++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mxflags)
---
---@param
---@return
function add_mxflags() end
                    
---
---**Scoped: target**
---
---Add objc++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mxxflags)
---
---@param
---@return
function add_mxxflags() end
                    
---
---**Scoped: target**
---
---Add swift compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_scflags)
---
---@param
---@return
function add_scflags() end
                    
---
---**Scoped: target**
---
---Add asm compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_asflags)
---
---@param
---@return
function add_asflags() end
                    
---
---**Scoped: target**
---
---Add go compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_gcflags)
---
---@param
---@return
function add_gcflags() end
                    
---
---**Scoped: target**
---
---Add dlang compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_dcflags)
---
---@param
---@return
function add_dcflags() end
                    
---
---**Scoped: target**
---
---Add rust compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_rcflags)
---
---@param
---@return
function add_rcflags() end
                    
---
---**Scoped: target**
---
---Add fortran compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_fcflags)
---
---@param
---@return
function add_fcflags() end
                    
---
---**Scoped: target**
---
---Add zig compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_zcflags)
---
---@param
---@return
function add_zcflags() end
                    
---
---**Scoped: target**
---
---Add cuda compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cuflags)
---
---@param
---@return
function add_cuflags() end
                    
---
---**Scoped: target**
---
---Add cuda device link flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_culdflags)
---
---@param
---@return
function add_culdflags() end
                    
---
---**Scoped: target**
---
---Add gencode settings for cuda devices
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cugencodes)
---
---@param
---@return
function add_cugencodes() end
                    
---
---**Scoped: target**
---
---Add static library link flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_ldflags)
---
---@param
---@return
function add_ldflags() end
                    
---
---**Scoped: target**
---
---Add archive library flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_arflags)
---
---@param
---@return
function add_arflags() end
                    
---
---**Scoped: target**
---
---Add dynamic library link flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_shflags)
---
---@param
---@return
function add_shflags() end
                    
---
---**Scoped: target**
---
---Add option dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_options)
---
---@param
---@return
function add_options() end
                    
---
---**Scoped: target**
---
---Add package dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_packages)
---
---@param
---@return
function add_packages() end
                    
---
---**Scoped: target**
---
---Add language standards
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_languages)
---
---@param
---@return
function add_languages() end
                    
---
---**Scoped: target**
---
---Add vector extensions
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_vectorexts)
---
---@param
---@return
function add_vectorexts() end
                    
---
---**Scoped: target**
---
---Add frameworks
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_frameworks)
---
---@param
---@return
function add_frameworks() end
                    
---
---**Scoped: target**
---
---Add framework search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_frameworkdirs)
---
---@param
---@return
function add_frameworkdirs() end
                    
---
---**Scoped: target**
---
---Set toolset
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_toolset)
---
---@param
---@return
function set_toolset() end
                    
---
---**Scoped: target**
---
---Set up the toolchain
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_toolchains)
---
---@param
---@return
function set_toolchains() end
                    
---
---**Scoped: target**
---
---Set the compilation platform for the specified target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_plat)
---
---@param
---@return
function set_plat() end
                    
---
---**Scoped: target**
---
---Set the compilation architecture of the specified target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_arch)
---
---@param
---@return
function set_arch() end
                    
---
---**Scoped: target**
---
---Set custom configuration values
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_values)
---
---@param
---@return
function set_values() end
                    
---
---**Scoped: target**
---
---Add custom configuration values
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_values)
---
---@param
---@return
function add_values() end
                    
---
---**Scoped: target**
---
---Set the running directory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_rundir)
---
---@param
---@return
function set_rundir() end
                    
---
---**Scoped: target**
---
---Set the list of run parameters
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_runargs)
---
---@param
---@return
function set_runargs() end
                    
---
---**Scoped: target**
---
---Add runtime environment variables
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_runenvs)
---
---@param
---@return
function add_runenvs() end
                    
---
---**Scoped: target**
---
---Set the runtime environment variable
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_runenv)
---
---@param
---@return
function set_runenv() end
                    
---
---**Scoped: target**
---
---Set the installation directory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_installdir)
---
---@param
---@return
function set_installdir() end
                    
---
---**Scoped: target**
---
---Set the installation prefix subdirectory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_prefixdir)
---
---@param
---@return
function set_prefixdir() end
                    
---
---**Scoped: target**
---
---Add installation files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_installfiles)
---
---@param
---@return
function add_installfiles() end
                    
---
---**Scoped: target**
---
---Add header files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_headerfiles)
---
---@param
---@return
function add_headerfiles() end
                    
---
---**Scoped: target**
---
---Set the output directory of configuration files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_configdir)
---
---@param
---@return
function set_configdir() end
                    
---
---**Scoped: target**
---
---Set template configuration variables
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_configvar)
---
---@param
---@return
function set_configvar() end
                    
---
---**Scoped: target**
---
---Add template configuration files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_configfiles)
---
---@param
---@return
function add_configfiles() end
                    
---
---**Scoped: target**
---
---Set build policy
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_policy)
---
---@param
---@return
function set_policy() end
                    
---
---**Scoped: target**
---
---Set the runtime library of the compilation target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_runtimes)
---
---@param
---@return
function set_runtimes() end
                    
---
---**Scoped: target**
---
---Set target group
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_group)
---
---@param
---@return
function set_group() end
                    
---
---**Scoped: target**
---
---Add Source file groups
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_filegroups)
---
---@param
---@return
function add_filegroups() end
                    
---
---**Scoped: target**
---
---Enabling or disabling exceptions
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_exceptions)
---
---@param
---@return
function set_exceptions() end
                    
---
---**Scoped: target**
---
---Set encodings
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_encodings)
---
---@param
---@return
function set_encodings() end
                    
---
---**Scoped: target**
---
---forceincludes
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_forceincludes)
---
---@param
---@return
function add_forceincludes() end
                    
---
---**Scoped: target**
---
---Adding Extra Files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_extrafiles)
---
---@param
---@return
function add_extrafiles() end
                    
---
---**Scoped: target**
---
---Add test case
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_tests)
---
---@param
---@return
function add_tests() end
                    