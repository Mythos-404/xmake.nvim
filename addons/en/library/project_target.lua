---@meta
---[project_target](https://xmake.io/#/manual/project_target)

---
---Define a project target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=target)
---
---@param target string
---@param scope? ScopeSyntax Scope syntax
---@return nil
function target(target, scope) end

---
---End target definition
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=target_end)
---
---@return nil
function target_end() end

---
---**Scoped: target**
---
---Set target kind
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_kind)
---
---@param kind TargetKind
---@return nil
function set_kind(kind) end

---
---**Scoped: target**
---
---Strip target symbols
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_strip)
---
---@param mode StripMode
---@return nil
function set_strip(mode) end

---
---**Scoped: target**
---
---Enable or disable target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_enabled)
---
---@param enabled boolean
---@return nil
function set_enabled(enabled) end

---
---**Scoped: target**
---
---Mark as default target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_default)
---
---@param is_default boolean
---@return nil
function set_default(is_default) end

---
---**Scoped: target**
---
---Set configuration options
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_options)
---
---@param name string
---@param ... string
---@return nil
function set_options(name, ...) end

---
---**Scoped: target**
---
---Set symbol info
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_symbols)
---
---@param info SymbolInfo
---@param ... SymbolInfo
---@return nil
function set_symbols(info, ...) end

---
---**Scoped: target**
---
---Set the base name of target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_basename)
---
---@param name string
---@return nil
function set_basename(name) end

---
---**Scoped: target**
---
---Set the full name of target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_filename)
---
---@param name string
---@return nil
function set_filename(name) end

---
---**Scoped: target**
---
---Set the leading name of the target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_prefixname)
---
---@param name string
---@return nil
function set_prefixname(name) end

---
---**Scoped: target**
---
---Set the postname of the target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_suffixname)
---
---@param name string
---@return nil
function set_suffixname(name) end

---
---**Scoped: target**
---
---Set the extension of the target file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_extension)
---
---@param ext string
---@return nil
function set_extension(ext) end

---
---**Scoped: target**
---
---Set compilation warning level
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_warnings)
---
---@param level WarningLevel
---@param ... WarningLevel
---@return nil
function set_warnings(level, ...) end

---
---**Scoped: target**
---
---Set competition optimization level
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_optimize)
---
---@param level OptimizeLevel
---@return nil
function set_optimize(level) end

---
---**Scoped: target**
---
---Set source code language standards
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_languages)
---
---@param lang LanguageStandard
---@param ... LanguageStandard
---@return nil
function set_languages(lang, ...) end

---
---**Scoped: target**
---
---Set float-point compilation mode
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_fpmodels)
---
---@param mode FloatPointMode
---@param ... FloatPointMode
---@return nil
function set_fpmodels(mode, ...) end

---
---**Scoped: target**
---
---Set output directories for target files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_targetdir)
---
---@param dir string
---@return nil
function set_targetdir(dir) end

---
---**Scoped: target**
---
---Set output directories for object files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_objectdir)
---
---@param dir string
---@return nil
function set_objectdir(dir) end

---
---**Scoped: target**
---
---Set output directories for dependent files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_dependir)
---
---@param dir string
---@return nil
function set_dependir(dir) end

---
---**Scoped: target**
---
---Add imports modules for the custom script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_imports)
---
---@param  name string
---@param ... string
---@return nil
function add_imports(name, ...) end

---
---**Scoped: target**
---
---Add custom compilation rule to target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_rules)
---
---@param name string
---@param ... string
---@return nil
function add_rules(name, ...) end

---
---**Scoped: target**
---
---Run custom load target configuration script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_load)
---
---@param func TargetHook
---@return nil
function on_load(func) end

---
---**Scoped: target**
---
---custom configuration script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_config)
---
---@param func TargetHook
---@return nil
function on_config(func) end

---
---**Scoped: target**
---
---Run custom link target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_link)
---
---@param func TargetHook
---@return nil
function on_link(func) end

---
---**Scoped: target**
---
---Run custom build target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build)
---
---@param func TargetHook
---@return nil
function on_build(func) end

---
---**Scoped: target**
---
---Run custom build target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build)
---
---@param platform_arch Platform Configure the platform and architecture, or just the platform. For example: "linux|x64", "linux|arm*", "windows".
---@param func TargetHook
---@return nil
function on_build(platform_arch, func) end

---
---**Scoped: target**
---
---Run custom build single file script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function on_build_file(func) end

---
---**Scoped: target**
---
---Run custom build files script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function on_build_files(func) end

---
---**Scoped: target**
---
---Run custom clean files script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_clean)
---
---@param func TargetHook
---@return nil
function on_clean(func) end

---
---**Scoped: target**
---
---Run custom package target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_package)
---
---@param func TargetHook
---@return nil
function on_package(func) end

---
---**Scoped: target**
---
---Run custom install target file script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_install)
---
---@param func TargetHook
---@return nil
function on_install(func) end

---
---**Scoped: target**
---
---Run custom uninstall target file script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_uninstall)
---
---@param func TargetHook
---@return nil
function on_uninstall(func) end

---
---**Scoped: target**
---
---Run custom run target script
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targeton_run)
---
---@param func TargetHook
---@return nil
function on_run(func) end

---
---**Scoped: target**
---
---Run custom script before linking target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_link)
---
---@param func TargetHook
---@return nil
function before_link(func) end

---
---**Scoped: target**
---
---Run custom script before building target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_build)
---
---@param func TargetHook
---@return nil
function before_build(func) end

---
---**Scoped: target**
---
---Run custom script before building single file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function before_build_file(func) end

---
---**Scoped: target**
---
---Run custom script before building files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function before_build_files(func) end

---
---**Scoped: target**
---
---Run custom script before cleaning target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_clean)
---
---@param func TargetHook
---@return nil
function before_clean(func) end

---
---**Scoped: target**
---
---Run custom script before packaging target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_package)
---
---@param func TargetHook
---@return nil
function before_package(func) end

---
---**Scoped: target**
---
---Run custom script before installing target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_install)
---
---@param func TargetHook
---@return nil
function before_install(func) end

---
---**Scoped: target**
---
---Run custom script before uninstalling target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_uninstall)
---
---@param func TargetHook
---@return nil
function before_uninstall(func) end

---
---**Scoped: target**
---
---Run custom script before running target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetbefore_run)
---
---@param func TargetHook
---@return nil
function before_run(func) end

---
---**Scoped: target**
---
---Run custom script after linking target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_link)
---
---@param func TargetHook
---@return nil
function after_link(func) end

---
---**Scoped: target**
---
---Run custom script after building target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_build)
---
---@param func TargetHook
---@return nil
function after_build(func) end

---
---**Scoped: target**
---
---Run custom script after building single file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function after_build_file(func) end

---
---**Scoped: target**
---
---Run custom script after building files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function after_build_files(func) end

---
---**Scoped: target**
---
---Run custom script after cleaning target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_clean)
---
---@param func TargetHook
---@return nil
function after_clean(func) end

---
---**Scoped: target**
---
---Run custom script after packaging target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_package)
---
---@param func TargetHook
---@return nil
function after_package(func) end

---
---**Scoped: target**
---
---Run custom script after installing target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_install)
---
---@param func TargetHook
---@return nil
function after_install(func) end

---
---**Scoped: target**
---
---Run custom script after uninstalling target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_uninstall)
---
---@param func TargetHook
---@return nil
function after_uninstall(func) end

---
---**Scoped: target**
---
---Run custom script after running target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetafter_run)
---
---@param func TargetHook
---@return nil
function after_run(func) end

---
---**Scoped: target**
---
---Set pre-compiled c header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pcheader)
---
---@param file string
---@return nil
function set_pcheader(file) end

---
---**Scoped: target**
---
---Set pre-compiled c++ header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pcxxheader)
---
---@param file string
---@return nil
function set_pcxxheader(file) end

---
---**Scoped: target**
---
---Set pre-compiled objc header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pmheader)
---
---@param file string
---@return nil
function set_pmheader(file) end

---
---**Scoped: target**
---
---Set pre-compiled objc++ header file
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_pmxxheader)
---
---@param file string
---@return nil
function set_pmxxheader(file) end

---
---**Scoped: target**
---
---Add target dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_deps)
---
---@param target string
---@param ... string
---@return nil
function add_deps(target, ...) end

---
---**Scoped: target**
---
---Add target dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_deps)
---
---@param target string
---@param access AccessSpecifier
---@return nil
function add_deps(target, access) end

---
---**Scoped: target**
---
---Add link libraries
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_links)
---
---@param name string
---@param ... string
---@return nil
function add_links(name, ...) end

---
---**Scoped: target**
---
---Add system link libraries
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_syslinks)
---
---@param name string
---@param ... string
---@return nil
function add_syslinks(name, ...) end

---
---**Scoped: target**
---
---Adjust link order
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkorders)
---
---@param name string
---@param ... string
---@return nil
function add_linkorders(name, ...) end

---
---**Scoped: target**
---
---Add link group
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkgroups)
---
---@param link string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link, opts) end

---
---**Scoped: target**
---
---Add link group
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkgroups)
---
---@param link1 string
---@param link2 string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link1, link2, opts) end

---
---**Scoped: target**
---
---Add source files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_files)
---
---@param file string
---@param ... string
---@return nil
function add_files(file, ...) end

---
---**Scoped: target**
---
---Add source files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_files)
---
---@param file string
---@param opts? CompilationOpts
---@return nil
function add_files(file, opts) end

---
---**Scoped: target**
---
---Remove source files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetremove_files)
---
---@param file string
---@param ... string
---@return nil
function remove_files(file, ...) end

---
---**Scoped: target**
---
---Remove the specified file from the preceding list of header files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetremove_headerfiles)
---
---@param file string
---@param ... string
---@return nil
function remove_headerfiles(file, ...) end

---
---**Scoped: target**
---
---Add link search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_linkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_linkdirs(dir, ...) end

---
---**Scoped: target**
---
---Add load search directories for dynamic libraries
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_rpathdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_rpathdirs(dir, ...) end

---
---**Scoped: target**
---
---Add include search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_includedirs)
---
---@param dir string
---@param ... string
---@return nil
function add_includedirs(dir, ...) end

---
---**Scoped: target**
---
---Add include search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_includedirs)
---
---@param dir string
---@param access AccessSpecifier
---@return nil
function add_includedirs(dir, access) end

---
---**Scoped: target**
---
---Add system header file search directory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_sysincludedirs)
---
---@param dir string
---@param ... string
---@return nil
function add_sysincludedirs(dir, ...) end

---
---**Scoped: target**
---
---Add macro definition
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_defines)
---
---@param def string
---@param ... string
---@return nil
function add_defines(def, ...) end

---
---**Scoped: target**
---
---Add macro undefinition
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_undefines)
---
---@param def string
---@param ... string
---@return nil
function add_undefines(def, ...) end

---
---**Scoped: target**
---
---Add c compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cflags(flag, ...) end

---
---**Scoped: target**
---
---Add c compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_cflags(flag, attr) end

---
---**Scoped: target**
---
---Add c/c++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cxflags(flag, ...) end

---
---**Scoped: target**
---
---Add c/c++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_cxflags(flag, attr) end

---
---**Scoped: target**
---
---Add c++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cxxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cxxflags(flag, ...) end

---
---**Scoped: target**
---
---Add c++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cxxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_cxxflags(flag, attr) end

---
---**Scoped: target**
---
---Add objc compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mflags)
---
---@param flag string
---@param ... string
---@return nil
function add_mflags(flag, ...) end

---
---**Scoped: target**
---
---Add objc compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_mflags(flag, attr) end

---
---**Scoped: target**
---
---Add objc/objc++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_mxflags(flag, ...) end

---
---**Scoped: target**
---
---Add objc/objc++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_mxflags(flag, attr) end

---
---**Scoped: target**
---
---Add objc++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mxxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_mxxflags(flag, ...) end

---
---**Scoped: target**
---
---Add objc++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_mxxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_mxxflags(flag, attr) end

---
---**Scoped: target**
---
---Add swift compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_scflags)
---
---@param flag string
---@param ... string
---@return nil
function add_scflags(flag, ...) end

---
---**Scoped: target**
---
---Add asm compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_asflags)
---
---@param flag string
---@param ... string
---@return nil
function add_asflags(flag, ...) end

---
---**Scoped: target**
---
---Add go compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_gcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_gcflags(flag, ...) end

---
---**Scoped: target**
---
---Add dlang compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_dcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_dcflags(flag, ...) end

---
---**Scoped: target**
---
---Add rust compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_rcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_rcflags(flag, ...) end

---
---**Scoped: target**
---
---Add fortran compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_fcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_fcflags(flag, ...) end

---
---**Scoped: target**
---
---Add zig compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_zcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_zcflags(flag, ...) end

---
---**Scoped: target**
---
---Add cuda compilation flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cuflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cuflags(flag, ...) end

---
---**Scoped: target**
---
---Add cuda device link flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_culdflags)
---
---@param flag string
---@param ... string
---@return nil
function add_culdflags(flag, ...) end

---
---**Scoped: target**
---
---Add gencode settings for cuda devices
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_cugencodes)
---
---@param setting string
---@param ... string
---@return nil
function add_cugencodes(setting, ...) end

---
---**Scoped: target**
---
---Add static library link flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_ldflags)
---
---@param flag string
---@param ... string
---@return nil
function add_ldflags(flag, ...) end

---
---**Scoped: target**
---
---Add archive library flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_arflags)
---
---@param flag string
---@param ... string
---@return nil
function add_arflags(flag, ...) end

---
---**Scoped: target**
---
---Add dynamic library link flags
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_shflags)
---
---@param flag string
---@param ... string
---@return nil
function add_shflags(flag, ...) end

---
---**Scoped: target**
---
---Add option dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_options)
---
---@param name string
---@param ... string
---@return nil
function add_options(name, ...) end

---
---**Scoped: target**
---
---Add package dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_packages)
---
---@param package string
---@param ... string
---@return nil
function add_packages(package, ...) end

---
---**Scoped: target**
---
---Add package dependencies
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_packages)
---
---@param package string
---@param attr { links: {}|string|string[] }
---@return nil
function add_packages(package, attr) end

---
---**Scoped: target**
---
---Add language standards
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_languages)
---
---@param lang LanguageStandard
---@param ... LanguageStandard
---@return nil
function add_languages(lang, ...) end

---
---**Scoped: target**
---
---Add vector extensions
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_vectorexts)
---
---@param vectorext VectorextSet
---@param ... VectorextSet
---@return nil
function add_vectorexts(vectorext, ...) end

---
---**Scoped: target**
---
---Add frameworks
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_frameworks)
---
---@param framework string
---@param ... string
---@return nil
function add_frameworks(framework, ...) end

---
---**Scoped: target**
---
---Add framework search directories
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_frameworkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_frameworkdirs(dir, ...) end

---
---**Scoped: target**
---
---Set toolset
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_toolset)
---
---@param tool ToolsetNames
---@param path string
---@return nil
function set_toolset(tool, path) end

---
---**Scoped: target**
---
---Set up the toolchain
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_toolchains)
---
---@param name Toolchainon
---@param ... Toolchainon
---@return nil
function set_toolchains(name, ...) end

---
---**Scoped: target**
---
---Set up the toolchain
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_toolchains)
---
---@param name Toolchainon
---@param opts ToolchainonOpts
---@return nil
function set_toolchains(name, opts) end

---
---**Scoped: target**
---
---Set the compilation platform for the specified target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_plat)
---
---@param plat Platform
---@return nil
function set_plat(plat) end

---
---**Scoped: target**
---
---Set the compilation architecture of the specified target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_arch)
---
---@param arch Architecture
---@return nil
function set_arch(arch) end

---
---**Scoped: target**
---
---Set custom configuration values
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_values)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function set_values(key, value, ...) end

---
---**Scoped: target**
---
---Add custom configuration values
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_values)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function add_values(key, value, ...) end

---
---**Scoped: target**
---
---Set the running directory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_rundir)
---
---@param dir string
---@return nil
function set_rundir(dir) end

---
---**Scoped: target**
---
---Set the list of run parameters
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_runargs)
---
---@param arg string
---@param ... string
---@return nil
function set_runargs(arg, ...) end

---
---**Scoped: target**
---
---Add runtime environment variables
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_runenvs)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function add_runenvs(key, value, ...) end

---
---**Scoped: target**
---
---Set the runtime environment variable
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_runenv)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function set_runenv(key, value, ...) end

---
---**Scoped: target**
---
---Set the installation directory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_installdir)
---
---@param dir string
---@return nil
function set_installdir(dir) end

---
---**Scoped: target**
---
---Set the installation prefix subdirectory
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_prefixdir)
---
---@param dir string
---@param opts? PrefixdirOpts
---@return nil
function set_prefixdir(dir, opts) end

---
---**Scoped: target**
---
---Add installation files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_installfiles)
---
---@param file string
---@param ... string
---@return nil
function add_installfiles(file, ...) end

---
---**Scoped: target**
---
---Add installation files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_installfiles)
---
---@param file string
---@param opts? { prefixdir?: string }
---@return nil
function add_installfiles(file, opts) end

---
---**Scoped: target**
---
---Add header files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_headerfiles)
---
---@param file string
---@param ... string
---@return nil
function add_headerfiles(file, ...) end

---
---**Scoped: target**
---
---Add header files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_headerfiles)
---
---@param file string
---@param opts? { prefixdir?: string, install?: boolean }
---@return nil
function add_headerfiles(file, opts) end

---
---**Scoped: target**
---
---Set the output directory of configuration files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_configdir)
---
---@param dir string
---@return nil
function set_configdir(dir) end

---
---**Scoped: target**
---
---Set template configuration variables
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_configvar)
---
---@param key string
---@param value string|integer|boolean
---@param opts? ConfigvarOpts
---@return nil
function set_configvar(key, value, opts) end

---
---**Scoped: target**
---
---Add template configuration files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_configfiles)
---
---@param file string
---@param ... string
---@return nil
function add_configfiles(file, ...) end

---
---**Scoped: target**
---
---Add template configuration files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_configfiles)
---
---@param file string
---@param opts? { prefixdir?: string, filename?: string }
---@return nil
function add_configfiles(file, opts) end

---
---**Scoped: target**
---
---Set build policy
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_policy)
---
---@param name BuildPolicy
---@param value any
---@param ... any
---@return nil
function set_policy(name, value, ...) end

---
---**Scoped: target**
---
---Set the runtime library of the compilation target
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_runtimes)
---
---@param runtime Runtime
---@param ... Runtime
---@return nil
function set_runtimes(runtime, ...) end

---
---**Scoped: target**
---
---Set target group
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_group)
---
---@param name string
---@return nil
function set_group(name) end

---
---**Scoped: target**
---
---Add Source file groups
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_filegroups)
---
---@param group string
---@param opts { rootdir?: string, files?: string, mode?: string }
---@return nil
function add_filegroups(group, opts) end

---
---**Scoped: target**
---
---Enabling or disabling exceptions
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_exceptions)
---
---@param type ExceptionType
---@param ... ExceptionType
---@return nil
function set_exceptions(type, ...) end

---
---**Scoped: target**
---
---Set encodings
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetset_encodings)
---
---@param encod string
---@param ... string
---@return nil
function set_encodings(encod, ...) end

---
---**Scoped: target**
---
---forceincludes
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_forceincludes)
---
---@param file string
---@param opts? { sourcekinds?: string|string[] }
---@return nil
function add_forceincludes(file, opts) end

---
---**Scoped: target**
---
---Adding Extra Files
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_extrafiles)
---
---@param file string
---@param ... string
---@return nil
function add_extrafiles(file, ...) end

---
---**Scoped: target**
---
---Add test case
---
---[Open in browser](https://xmake.io/#/manual/project_target?id=targetadd_tests)
---
---@param name string
---@param opts? TestOpts
---@return nil
function add_tests(name, opts) end
