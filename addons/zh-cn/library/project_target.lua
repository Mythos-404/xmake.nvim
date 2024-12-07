---@meta
---[project_target](https://xmake.io/#/zh-cn/manual/project_target)

---
---定义工程目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=target)
---
---@param target string
---@param scope? ScopeSyntax 范围语法
---@return nil
function target(target, scope) end

---
---结束定义工程目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=target_end)
---
---@return nil
function target_end() end

---
---**范围: target**
---
---设置目标编译类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_kind)
---
---@param kind TargetKind
---@return nil
function set_kind(kind) end

---
---**范围: target**
---
---设置是否strip信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_strip)
---
---@param mode StripMode
---@return nil
function set_strip(mode) end

---
---**范围: target**
---
---设置是否启用或禁用目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_enabled)
---
---@param enabled boolean
---@return nil
function set_enabled(enabled) end

---
---**范围: target**
---
---设置是否为默认构建安装目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_default)
---
---@param is_default boolean
---@return nil
function set_default(is_default) end

---
---**范围: target**
---
---设置关联选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_options)
---
---@param name string
---@param ... string
---@return nil
function set_options(name, ...) end

---
---**范围: target**
---
---设置符号信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_symbols)
---
---@param info SymbolInfo
---@param ... SymbolInfo
---@return nil
function set_symbols(info, ...) end

---
---**范围: target**
---
---设置目标文件名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_basename)
---
---@param name string
---@return nil
function set_basename(name) end

---
---**范围: target**
---
---设置目标文件全名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_filename)
---
---@param name string
---@return nil
function set_filename(name) end

---
---**范围: target**
---
---设置目标文件的前置名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_prefixname)
---
---@param name string
---@return nil
function set_prefixname(name) end

---
---**范围: target**
---
---设置目标文件的后置名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_suffixname)
---
---@param name string
---@return nil
function set_suffixname(name) end

---
---**范围: target**
---
---设置目标文件的扩展名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_extension)
---
---@param ext string
---@return nil
function set_extension(ext) end

---
---**范围: target**
---
---设置警告级别
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_warnings)
---
---@param level WarningLevel
---@param ... WarningLevel
---@return nil
function set_warnings(level, ...) end

---
---**范围: target**
---
---设置优化级别
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_optimize)
---
---@param level OptimizeLevel
---@return nil
function set_optimize(level) end

---
---**范围: target**
---
---设置代码语言标准
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_languages)
---
---@param lang LanguageStandard
---@param ... LanguageStandard
---@return nil
function set_languages(lang, ...) end

---
---**范围: target**
---
---设置float-point编译模式
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_fpmodels)
---
---@param mode FloatPointMode
---@param ... FloatPointMode
---@return nil
function set_fpmodels(mode, ...) end

---
---**范围: target**
---
---设置生成目标文件目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_targetdir)
---
---@param dir string
---@return nil
function set_targetdir(dir) end

---
---**范围: target**
---
---设置对象文件生成目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_objectdir)
---
---@param dir string
---@return nil
function set_objectdir(dir) end

---
---**范围: target**
---
---设置依赖文件生成目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_dependir)
---
---@param dir string
---@return nil
function set_dependir(dir) end

---
---**范围: target**
---
---为自定义脚本预先导入扩展模块
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_imports)
---
---@param  name string
---@param ... string
---@return nil
function add_imports(name, ...) end

---
---**范围: target**
---
---添加规则到目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_rules)
---
---@param name string
---@param ... string
---@return nil
function add_rules(name, ...) end

---
---**范围: target**
---
---自定义目标加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_load)
---
---@param func TargetHook
---@return nil
function on_load(func) end

---
---**范围: target**
---
---自定义配置脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_config)
---
---@param func TargetHook
---@return nil
function on_config(func) end

---
---**范围: target**
---
---自定义链接脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_link)
---
---@param func TargetHook
---@return nil
function on_link(func) end

---
---**范围: target**
---
---自定义编译脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build)
---
---@param func TargetHook
---@return nil
function on_build(func) end

---
---**范围: target**
---
---自定义编译脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build)
---
---@param platform_arch Platform 配置平台和架构, 或者只有平台. 例如: "linux|x64", "linux|arm*", "windows"
---@param func TargetHook
---@return nil
function on_build(platform_arch, func) end

---
---**范围: target**
---
---自定义编译脚本, 实现单文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function on_build_file(func) end

---
---**范围: target**
---
---自定义编译脚本, 实现多文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function on_build_files(func) end

---
---**范围: target**
---
---自定义清理脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_clean)
---
---@param func TargetHook
---@return nil
function on_clean(func) end

---
---**范围: target**
---
---自定义打包脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_package)
---
---@param func TargetHook
---@return nil
function on_package(func) end

---
---**范围: target**
---
---自定义安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_install)
---
---@param func TargetHook
---@return nil
function on_install(func) end

---
---**范围: target**
---
---自定义卸载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_uninstall)
---
---@param func TargetHook
---@return nil
function on_uninstall(func) end

---
---**范围: target**
---
---自定义运行脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_run)
---
---@param func TargetHook
---@return nil
function on_run(func) end

---
---**范围: target**
---
---在链接之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_link)
---
---@param func TargetHook
---@return nil
function before_link(func) end

---
---**范围: target**
---
---在构建之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_build)
---
---@param func TargetHook
---@return nil
function before_build(func) end

---
---**范围: target**
---
---自定义编译前的脚本, 实现单文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function before_build_file(func) end

---
---**范围: target**
---
---自定义编译前的脚本, 实现多文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function before_build_files(func) end

---
---**范围: target**
---
---在清理之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_clean)
---
---@param func TargetHook
---@return nil
function before_clean(func) end

---
---**范围: target**
---
---在打包之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_package)
---
---@param func TargetHook
---@return nil
function before_package(func) end

---
---**范围: target**
---
---在安装之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_install)
---
---@param func TargetHook
---@return nil
function before_install(func) end

---
---**范围: target**
---
---在卸载之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_uninstall)
---
---@param func TargetHook
---@return nil
function before_uninstall(func) end

---
---**范围: target**
---
---在运行之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_run)
---
---@param func TargetHook
---@return nil
function before_run(func) end

---
---**范围: target**
---
---在链接之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_link)
---
---@param func TargetHook
---@return nil
function after_link(func) end

---
---**范围: target**
---
---在构建之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_build)
---
---@param func TargetHook
---@return nil
function after_build(func) end

---
---**范围: target**
---
---自定义编译前的脚本, 实现单文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function after_build_file(func) end

---
---**范围: target**
---
---自定义编译前的脚本, 实现多文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function after_build_files(func) end

---
---**范围: target**
---
---在清理之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_clean)
---
---@param func TargetHook
---@return nil
function after_clean(func) end

---
---**范围: target**
---
---在打包之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_package)
---
---@param func TargetHook
---@return nil
function after_package(func) end

---
---**范围: target**
---
---在安装之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_install)
---
---@param func TargetHook
---@return nil
function after_install(func) end

---
---**范围: target**
---
---在卸载之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_uninstall)
---
---@param func TargetHook
---@return nil
function after_uninstall(func) end

---
---**范围: target**
---
---在运行之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_run)
---
---@param func TargetHook
---@return nil
function after_run(func) end

---
---**范围: target**
---
---设置 C 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pcheader)
---
---@param file string
---@return nil
function set_pcheader(file) end

---
---**范围: target**
---
---设置 C++ 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pcxxheader)
---
---@param file string
---@return nil
function set_pcxxheader(file) end

---
---**范围: target**
---
---设置 ObjC 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pmheader)
---
---@param file string
---@return nil
function set_pmheader(file) end

---
---**范围: target**
---
---设置 ObjC++ 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pmxxheader)
---
---@param file string
---@return nil
function set_pmxxheader(file) end

---
---**范围: target**
---
---添加子工程目标依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_deps)
---
---@param target string
---@param ... string
---@return nil
function add_deps(target, ...) end

---
---**范围: target**
---
---添加子工程目标依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_deps)
---
---@param target string
---@param access AccessSpecifier
---@return nil
function add_deps(target, access) end

---
---**范围: target**
---
---添加链接库名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_links)
---
---@param name string
---@param ... string
---@return nil
function add_links(name, ...) end

---
---**范围: target**
---
---添加系统链接库名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_syslinks)
---
---@param name string
---@param ... string
---@return nil
function add_syslinks(name, ...) end

---
---**范围: target**
---
---调整链接顺序
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkorders)
---
---@param name string
---@param ... string
---@return nil
function add_linkorders(name, ...) end

---
---**范围: target**
---
---添加链接组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkgroups)
---
---@param link string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link, opts) end

---
---**范围: target**
---
---添加链接组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkgroups)
---
---@param link1 string
---@param link2 string
---@param opts LinkGroupOpts
---@return nil
function add_linkgroups(link1, link2, opts) end

---
---**范围: target**
---
---添加源代码文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_files)
---
---@param file string
---@param ... string
---@return nil
function add_files(file, ...) end

---
---**范围: target**
---
---添加源代码文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_files)
---
---@param file string
---@param opts? CompilationOpts
---@return nil
function add_files(file, opts) end

---
---**范围: target**
---
---从前面的源代码文件列表中删除指定文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetremove_files)
---
---@param file string
---@param ... string
---@return nil
function remove_files(file, ...) end

---
---**范围: target**
---
---从前面的头文件列表中删除指定文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetremove_headerfiles)
---
---@param file string
---@param ... string
---@return nil
function remove_headerfiles(file, ...) end

---
---**范围: target**
---
---添加链接库搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_linkdirs(dir, ...) end

---
---**范围: target**
---
---添加程序运行时动态库的加载搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_rpathdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_rpathdirs(dir, ...) end

---
---**范围: target**
---
---添加头文件搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_includedirs)
---
---@param dir string
---@param ... string
---@return nil
function add_includedirs(dir, ...) end

---
---**范围: target**
---
---添加头文件搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_includedirs)
---
---@param dir string
---@param access AccessSpecifier
---@return nil
function add_includedirs(dir, access) end

---
---**范围: target**
---
---添加系统头文件搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_sysincludedirs)
---
---@param dir string
---@param ... string
---@return nil
function add_sysincludedirs(dir, ...) end

---
---**范围: target**
---
---添加宏定义
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_defines)
---
---@param def string
---@param ... string
---@return nil
function add_defines(def, ...) end

---
---**范围: target**
---
---取消宏定义
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_undefines)
---
---@param def string
---@param ... string
---@return nil
function add_undefines(def, ...) end

---
---**范围: target**
---
---添加c编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cflags(flag, ...) end

---
---**范围: target**
---
---添加c编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_cflags(flag, attr) end

---
---**范围: target**
---
---添加c/c++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cxflags(flag, ...) end

---
---**范围: target**
---
---添加c/c++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_cxflags(flag, attr) end

---
---**范围: target**
---
---添加c++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cxxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cxxflags(flag, ...) end

---
---**范围: target**
---
---添加c++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cxxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_cxxflags(flag, attr) end

---
---**范围: target**
---
---添加objc编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mflags)
---
---@param flag string
---@param ... string
---@return nil
function add_mflags(flag, ...) end

---
---**范围: target**
---
---添加objc编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_mflags(flag, attr) end

---
---**范围: target**
---
---添加objc/objc++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_mxflags(flag, ...) end

---
---**范围: target**
---
---添加objc/objc++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_mxflags(flag, attr) end

---
---**范围: target**
---
---添加objc++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mxxflags)
---
---@param flag string
---@param ... string
---@return nil
function add_mxxflags(flag, ...) end

---
---**范围: target**
---
---添加objc++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mxxflags)
---
---@param flag string
---@param attr CompilationFlagAttr
---@return nil
function add_mxxflags(flag, attr) end

---
---**范围: target**
---
---添加swift编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_scflags)
---
---@param flag string
---@param ... string
---@return nil
function add_scflags(flag, ...) end

---
---**范围: target**
---
---添加汇编编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_asflags)
---
---@param flag string
---@param ... string
---@return nil
function add_asflags(flag, ...) end

---
---**范围: target**
---
---添加go编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_gcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_gcflags(flag, ...) end

---
---**范围: target**
---
---添加dlang编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_dcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_dcflags(flag, ...) end

---
---**范围: target**
---
---添加rust编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_rcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_rcflags(flag, ...) end

---
---**范围: target**
---
---添加fortran编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_fcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_fcflags(flag, ...) end

---
---**范围: target**
---
---添加zig编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_zcflags)
---
---@param flag string
---@param ... string
---@return nil
function add_zcflags(flag, ...) end

---
---**范围: target**
---
---添加cuda编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cuflags)
---
---@param flag string
---@param ... string
---@return nil
function add_cuflags(flag, ...) end

---
---**范围: target**
---
---添加cuda设备链接选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_culdflags)
---
---@param flag string
---@param ... string
---@return nil
function add_culdflags(flag, ...) end

---
---**范围: target**
---
---添加cuda设备的gencode设置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cugencodes)
---
---@param setting string
---@param ... string
---@return nil
function add_cugencodes(setting, ...) end

---
---**范围: target**
---
---添加链接选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_ldflags)
---
---@param flag string
---@param ... string
---@return nil
function add_ldflags(flag, ...) end

---
---**范围: target**
---
---添加静态库归档选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_arflags)
---
---@param flag string
---@param ... string
---@return nil
function add_arflags(flag, ...) end

---
---**范围: target**
---
---添加动态库链接选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_shflags)
---
---@param flag string
---@param ... string
---@return nil
function add_shflags(flag, ...) end

---
---**范围: target**
---
---添加关联选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_options)
---
---@param name string
---@param ... string
---@return nil
function add_options(name, ...) end

---
---**范围: target**
---
---添加包依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_packages)
---
---@param package string
---@param ... string
---@return nil
function add_packages(package, ...) end

---
---**范围: target**
---
---添加包依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_packages)
---
---@param package string
---@param attr { links: {}|string|string[] }
---@return nil
function add_packages(package, attr) end

---
---**范围: target**
---
---添加语言标准
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_languages)
---
---@param lang LanguageStandard
---@param ... LanguageStandard
---@return nil
function add_languages(lang, ...) end

---
---**范围: target**
---
---添加向量扩展指令
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_vectorexts)
---
---@param vectorext VectorextSet
---@param ... VectorextSet
---@return nil
function add_vectorexts(vectorext, ...) end

---
---**范围: target**
---
---添加链接框架
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_frameworks)
---
---@param framework string
---@param ... string
---@return nil
function add_frameworks(framework, ...) end

---
---**范围: target**
---
---添加链接框架搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_frameworkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_frameworkdirs(dir, ...) end

---
---**范围: target**
---
---设置工具集
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_toolset)
---
---@param tool ToolsetNames
---@param path string
---@return nil
function set_toolset(tool, path) end

---
---**范围: target**
---
---设置工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_toolchains)
---
---@param name Toolchainon
---@param ... Toolchainon
---@return nil
function set_toolchains(name, ...) end

---
---**范围: target**
---
---设置工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_toolchains)
---
---@param name Toolchainon
---@param opts ToolchainonOpts
---@return nil
function set_toolchains(name, opts) end

---
---**范围: target**
---
---设置指定目标的编译平台
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_plat)
---
---@param plat Platform
---@return nil
function set_plat(plat) end

---
---**范围: target**
---
---设置指定目标的编译架构
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_arch)
---
---@param arch Architecture
---@return nil
function set_arch(arch) end

---
---**范围: target**
---
---设置一些扩展配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_values)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function set_values(key, value, ...) end

---
---**范围: target**
---
---添加一些扩展配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_values)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function add_values(key, value, ...) end

---
---**范围: target**
---
---设置运行目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_rundir)
---
---@param dir string
---@return nil
function set_rundir(dir) end

---
---**范围: target**
---
---设置运行参数列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_runargs)
---
---@param arg string
---@param ... string
---@return nil
function set_runargs(arg, ...) end

---
---**范围: target**
---
---添加运行环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_runenvs)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function add_runenvs(key, value, ...) end

---
---**范围: target**
---
---设置运行环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_runenv)
---
---@param key string
---@param value string
---@param ... string
---@return nil
function set_runenv(key, value, ...) end

---
---**范围: target**
---
---设置安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_installdir)
---
---@param dir string
---@return nil
function set_installdir(dir) end

---
---**范围: target**
---
---设置安装前置子目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_prefixdir)
---
---@param dir string
---@param opts? PrefixdirOpts
---@return nil
function set_prefixdir(dir, opts) end

---
---**范围: target**
---
---添加安装文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_installfiles)
---
---@param file string
---@param ... string
---@return nil
function add_installfiles(file, ...) end

---
---**范围: target**
---
---添加安装文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_installfiles)
---
---@param file string
---@param opts? { prefixdir?: string }
---@return nil
function add_installfiles(file, opts) end

---
---**范围: target**
---
---添加安装头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_headerfiles)
---
---@param file string
---@param ... string
---@return nil
function add_headerfiles(file, ...) end

---
---**范围: target**
---
---添加安装头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_headerfiles)
---
---@param file string
---@param opts? { prefixdir?: string, install?: boolean }
---@return nil
function add_headerfiles(file, opts) end

---
---**范围: target**
---
---设置模板配置文件的输出目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_configdir)
---
---@param dir string
---@return nil
function set_configdir(dir) end

---
---**范围: target**
---
---设置模板配置变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_configvar)
---
---@param key string
---@param value string
---@param opts? ConfigvarOpts
---@return nil
function set_configvar(key, value, opts) end

---
---**范围: target**
---
---添加模板配置文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_configfiles)
---
---@param file string
---@param ... string
---@return nil
function add_configfiles(file, ...) end

---
---**范围: target**
---
---添加模板配置文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_configfiles)
---
---@param file string
---@param opts? { prefixdir?: string, filename?: string }
---@return nil
function add_configfiles(file, opts) end

---
---**范围: target**
---
---设置构建行为策略
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_policy)
---
---@param name BuildPolicy
---@param value any
---@param ... any
---@return nil
function set_policy(name, value, ...) end

---
---**范围: target**
---
---设置编译目标依赖的运行时库
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_runtimes)
---
---@param runtime Runtime
---@param ... Runtime
---@return nil
function set_runtimes(runtime, ...) end

---
---**范围: target**
---
---设置目标分组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_group)
---
---@param name string
---@return nil
function set_group(name) end

---
---**范围: target**
---
---添加源文件分组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_filegroups)
---
---@param group string
---@param opts { rootdir?: string, files?: string, mode?: string }
---@return nil
function add_filegroups(group, opts) end

---
---**范围: target**
---
---启用或者禁用异常
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_exceptions)
---
---@param type ExceptionType
---@param ... ExceptionType
---@return nil
function set_exceptions(type, ...) end

---
---**范围: target**
---
---设置编码
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_encodings)
---
---@param encod string
---@param ... string
---@return nil
function set_encodings(encod, ...) end

---
---**范围: target**
---
---强制添加 includes
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_forceincludes)
---
---@param file string
---@param opts? { sourcekinds?: string|string[] }
---@return nil
function add_forceincludes(file, opts) end

---
---**范围: target**
---
---添加额外的文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_extrafiles)
---
---@param file string
---@param ... string
---@return nil
function add_extrafiles(file, ...) end

---
---**范围: target**
---
---添加测试用例
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_tests)
---
---@param name string
---@param opts? TestOpts
---@return nil
function add_tests(name, opts) end
