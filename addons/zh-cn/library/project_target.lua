---@meta
---[project_target](https://xmake.io/#/zh-cn/manual/project_target)

---
---定义工程目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=target)
---
---@param
---@return
function target() end

---
---结束定义工程目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=target_end)
---
---@param
---@return
function target_end() end

---
---**范围: target**
---
---设置目标编译类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_kind)
---
---@param
---@return
function set_kind() end

---
---**范围: target**
---
---设置是否strip信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_strip)
---
---@param
---@return
function set_strip() end

---
---**范围: target**
---
---设置是否启用或禁用目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_enabled)
---
---@param
---@return
function set_enabled() end

---
---**范围: target**
---
---设置是否为默认构建安装目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_default)
---
---@param
---@return
function set_default() end

---
---**范围: target**
---
---设置关联选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_options)
---
---@param
---@return
function set_options() end

---
---**范围: target**
---
---设置符号信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_symbols)
---
---@param
---@return
function set_symbols() end

---
---**范围: target**
---
---设置目标文件名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_basename)
---
---@param
---@return
function set_basename() end

---
---**范围: target**
---
---设置目标文件全名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_filename)
---
---@param
---@return
function set_filename() end

---
---**范围: target**
---
---设置目标文件的前置名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_prefixname)
---
---@param
---@return
function set_prefixname() end

---
---**范围: target**
---
---设置目标文件的后置名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_suffixname)
---
---@param
---@return
function set_suffixname() end

---
---**范围: target**
---
---设置目标文件的扩展名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_extension)
---
---@param
---@return
function set_extension() end

---
---**范围: target**
---
---设置警告级别
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_warnings)
---
---@param
---@return
function set_warnings() end

---
---**范围: target**
---
---设置优化级别
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_optimize)
---
---@param
---@return
function set_optimize() end

---
---**范围: target**
---
---设置代码语言标准
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_languages)
---
---@param
---@return
function set_languages() end

---
---**范围: target**
---
---设置float-point编译模式
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_fpmodels)
---
---@param
---@return
function set_fpmodels() end

---
---**范围: target**
---
---设置生成目标文件目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_targetdir)
---
---@param
---@return
function set_targetdir() end

---
---**范围: target**
---
---设置对象文件生成目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_objectdir)
---
---@param
---@return
function set_objectdir() end

---
---**范围: target**
---
---设置依赖文件生成目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_dependir)
---
---@param
---@return
function set_dependir() end

---
---**范围: target**
---
---为自定义脚本预先导入扩展模块
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_imports)
---
---@param
---@return
function add_imports() end

---
---**范围: target**
---
---添加规则到目标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_rules)
---
---@param
---@return
function add_rules() end

---
---**范围: target**
---
---自定义目标加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_load)
---
---@param
---@return
function on_load() end

---
---**范围: target**
---
---自定义配置脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_config)
---
---@param
---@return
function on_config() end

---
---**范围: target**
---
---自定义链接脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_link)
---
---@param
---@return
function on_link() end

---
---**范围: target**
---
---自定义编译脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build)
---
---@param
---@return
function on_build() end

---
---**范围: target**
---
---自定义编译脚本, 实现单文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build_file)
---
---@param
---@return
function on_build_file() end

---
---**范围: target**
---
---自定义编译脚本, 实现多文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_build_files)
---
---@param
---@return
function on_build_files() end

---
---**范围: target**
---
---自定义清理脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_clean)
---
---@param
---@return
function on_clean() end

---
---**范围: target**
---
---自定义打包脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_package)
---
---@param
---@return
function on_package() end

---
---**范围: target**
---
---自定义安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_install)
---
---@param
---@return
function on_install() end

---
---**范围: target**
---
---自定义卸载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_uninstall)
---
---@param
---@return
function on_uninstall() end

---
---**范围: target**
---
---自定义运行脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targeton_run)
---
---@param
---@return
function on_run() end

---
---**范围: target**
---
---在链接之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_link)
---
---@param
---@return
function before_link() end

---
---**范围: target**
---
---在构建之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_build)
---
---@param
---@return
function before_build() end

---
---**范围: target**
---
---自定义编译前的脚本, 实现单文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_build_file)
---
---@param
---@return
function before_build_file() end

---
---**范围: target**
---
---自定义编译前的脚本, 实现多文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_build_files)
---
---@param
---@return
function before_build_files() end

---
---**范围: target**
---
---在清理之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_clean)
---
---@param
---@return
function before_clean() end

---
---**范围: target**
---
---在打包之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_package)
---
---@param
---@return
function before_package() end

---
---**范围: target**
---
---在安装之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_install)
---
---@param
---@return
function before_install() end

---
---**范围: target**
---
---在卸载之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_uninstall)
---
---@param
---@return
function before_uninstall() end

---
---**范围: target**
---
---在运行之前执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetbefore_run)
---
---@param
---@return
function before_run() end

---
---**范围: target**
---
---在链接之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_link)
---
---@param
---@return
function after_link() end

---
---**范围: target**
---
---在构建之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_build)
---
---@param
---@return
function after_build() end

---
---**范围: target**
---
---自定义编译前的脚本, 实现单文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_build_file)
---
---@param
---@return
function after_build_file() end

---
---**范围: target**
---
---自定义编译前的脚本, 实现多文件构建
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_build_files)
---
---@param
---@return
function after_build_files() end

---
---**范围: target**
---
---在清理之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_clean)
---
---@param
---@return
function after_clean() end

---
---**范围: target**
---
---在打包之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_package)
---
---@param
---@return
function after_package() end

---
---**范围: target**
---
---在安装之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_install)
---
---@param
---@return
function after_install() end

---
---**范围: target**
---
---在卸载之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_uninstall)
---
---@param
---@return
function after_uninstall() end

---
---**范围: target**
---
---在运行之后执行一些自定义脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetafter_run)
---
---@param
---@return
function after_run() end

---
---**范围: target**
---
---设置 C 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pcheader)
---
---@param
---@return
function set_pcheader() end

---
---**范围: target**
---
---设置 C++ 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pcxxheader)
---
---@param
---@return
function set_pcxxheader() end

---
---**范围: target**
---
---设置 ObjC 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pmheader)
---
---@param
---@return
function set_pmheader() end

---
---**范围: target**
---
---设置 ObjC++ 预编译头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_pmxxheader)
---
---@param
---@return
function set_pmxxheader() end

---
---**范围: target**
---
---添加子工程目标依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_deps)
---
---@param
---@return
function add_deps() end

---
---**范围: target**
---
---添加链接库名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_links)
---
---@param
---@return
function add_links() end

---
---**范围: target**
---
---添加系统链接库名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_syslinks)
---
---@param
---@return
function add_syslinks() end

---
---**范围: target**
---
---调整链接顺序
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkorders)
---
---@param
---@return
function add_linkorders() end

---
---**范围: target**
---
---添加链接组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkgroups)
---
---@param
---@return
function add_linkgroups() end

---
---**范围: target**
---
---添加源代码文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_files)
---
---@param
---@return
function add_files() end

---
---**范围: target**
---
---从前面的源代码文件列表中删除指定文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetremove_files)
---
---@param
---@return
function remove_files() end

---
---**范围: target**
---
---从前面的头文件列表中删除指定文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetremove_headerfiles)
---
---@param
---@return
function remove_headerfiles() end

---
---**范围: target**
---
---添加链接库搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_linkdirs)
---
---@param
---@return
function add_linkdirs() end

---
---**范围: target**
---
---添加程序运行时动态库的加载搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_rpathdirs)
---
---@param
---@return
function add_rpathdirs() end

---
---**范围: target**
---
---添加头文件搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_includedirs)
---
---@param
---@return
function add_includedirs() end

---
---**范围: target**
---
---添加系统头文件搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_sysincludedirs)
---
---@param
---@return
function add_sysincludedirs() end

---
---**范围: target**
---
---添加宏定义
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_defines)
---
---@param
---@return
function add_defines() end

---
---**范围: target**
---
---取消宏定义
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_undefines)
---
---@param
---@return
function add_undefines() end

---
---**范围: target**
---
---添加c编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cflags)
---
---@param
---@return
function add_cflags() end

---
---**范围: target**
---
---添加c/c++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cxflags)
---
---@param
---@return
function add_cxflags() end

---
---**范围: target**
---
---添加c++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cxxflags)
---
---@param
---@return
function add_cxxflags() end

---
---**范围: target**
---
---添加objc编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mflags)
---
---@param
---@return
function add_mflags() end

---
---**范围: target**
---
---添加objc/objc++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mxflags)
---
---@param
---@return
function add_mxflags() end

---
---**范围: target**
---
---添加objc++编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_mxxflags)
---
---@param
---@return
function add_mxxflags() end

---
---**范围: target**
---
---添加swift编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_scflags)
---
---@param
---@return
function add_scflags() end

---
---**范围: target**
---
---添加汇编编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_asflags)
---
---@param
---@return
function add_asflags() end

---
---**范围: target**
---
---添加go编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_gcflags)
---
---@param
---@return
function add_gcflags() end

---
---**范围: target**
---
---添加dlang编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_dcflags)
---
---@param
---@return
function add_dcflags() end

---
---**范围: target**
---
---添加rust编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_rcflags)
---
---@param
---@return
function add_rcflags() end

---
---**范围: target**
---
---添加fortran编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_fcflags)
---
---@param
---@return
function add_fcflags() end

---
---**范围: target**
---
---添加zig编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_zcflags)
---
---@param
---@return
function add_zcflags() end

---
---**范围: target**
---
---添加cuda编译选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cuflags)
---
---@param
---@return
function add_cuflags() end

---
---**范围: target**
---
---添加cuda设备链接选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_culdflags)
---
---@param
---@return
function add_culdflags() end

---
---**范围: target**
---
---添加cuda设备的gencode设置
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_cugencodes)
---
---@param
---@return
function add_cugencodes() end

---
---**范围: target**
---
---添加链接选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_ldflags)
---
---@param
---@return
function add_ldflags() end

---
---**范围: target**
---
---添加静态库归档选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_arflags)
---
---@param
---@return
function add_arflags() end

---
---**范围: target**
---
---添加动态库链接选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_shflags)
---
---@param
---@return
function add_shflags() end

---
---**范围: target**
---
---添加关联选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_options)
---
---@param
---@return
function add_options() end

---
---**范围: target**
---
---添加包依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_packages)
---
---@param
---@return
function add_packages() end

---
---**范围: target**
---
---添加语言标准
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_languages)
---
---@param
---@return
function add_languages() end

---
---**范围: target**
---
---添加向量扩展指令
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_vectorexts)
---
---@param
---@return
function add_vectorexts() end

---
---**范围: target**
---
---添加链接框架
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_frameworks)
---
---@param
---@return
function add_frameworks() end

---
---**范围: target**
---
---添加链接框架搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_frameworkdirs)
---
---@param
---@return
function add_frameworkdirs() end

---
---**范围: target**
---
---设置工具集
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_toolset)
---
---@param
---@return
function set_toolset() end

---
---**范围: target**
---
---设置工具链
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_toolchains)
---
---@param
---@return
function set_toolchains() end

---
---**范围: target**
---
---设置指定目标的编译平台
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_plat)
---
---@param
---@return
function set_plat() end

---
---**范围: target**
---
---设置指定目标的编译架构
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_arch)
---
---@param
---@return
function set_arch() end

---
---**范围: target**
---
---设置一些扩展配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_values)
---
---@param
---@return
function set_values() end

---
---**范围: target**
---
---添加一些扩展配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_values)
---
---@param
---@return
function add_values() end

---
---**范围: target**
---
---设置运行目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_rundir)
---
---@param
---@return
function set_rundir() end

---
---**范围: target**
---
---设置运行参数列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_runargs)
---
---@param
---@return
function set_runargs() end

---
---**范围: target**
---
---添加运行环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_runenvs)
---
---@param
---@return
function add_runenvs() end

---
---**范围: target**
---
---设置运行环境变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_runenv)
---
---@param
---@return
function set_runenv() end

---
---**范围: target**
---
---设置安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_installdir)
---
---@param
---@return
function set_installdir() end

---
---**范围: target**
---
---设置安装前置子目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_prefixdir)
---
---@param
---@return
function set_prefixdir() end

---
---**范围: target**
---
---添加安装文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_installfiles)
---
---@param
---@return
function add_installfiles() end

---
---**范围: target**
---
---添加安装头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_headerfiles)
---
---@param
---@return
function add_headerfiles() end

---
---**范围: target**
---
---设置模板配置文件的输出目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_configdir)
---
---@param
---@return
function set_configdir() end

---
---**范围: target**
---
---设置模板配置变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_configvar)
---
---@param
---@return
function set_configvar() end

---
---**范围: target**
---
---添加模板配置文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_configfiles)
---
---@param
---@return
function add_configfiles() end

---
---**范围: target**
---
---设置构建行为策略
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_policy)
---
---@param
---@return
function set_policy() end

---
---**范围: target**
---
---设置编译目标依赖的运行时库
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_runtimes)
---
---@param
---@return
function set_runtimes() end

---
---**范围: target**
---
---设置目标分组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_group)
---
---@param
---@return
function set_group() end

---
---**范围: target**
---
---添加源文件分组
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_filegroups)
---
---@param
---@return
function add_filegroups() end

---
---**范围: target**
---
---启用或者禁用异常
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_exceptions)
---
---@param
---@return
function set_exceptions() end

---
---**范围: target**
---
---设置编码
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetset_encodings)
---
---@param
---@return
function set_encodings() end

---
---**范围: target**
---
---强制添加 includes
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_forceincludes)
---
---@param
---@return
function add_forceincludes() end

---
---**范围: target**
---
---添加额外的文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_extrafiles)
---
---@param
---@return
function add_extrafiles() end

---
---**范围: target**
---
---添加测试用例
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_tests)
---
---@param
---@return
function add_tests() end
