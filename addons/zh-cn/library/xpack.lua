---@meta
---[xpack](https://xmake.io/#/zh-cn/manual/xpack)

---
---定义 XPack
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function xpack(name, scope) end

---
---**范围: xpack**
---
---设置包版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_version)
---
---@param version string
---@return nil
function set_version(version) end

---
---**范围: xpack**
---
---设置主页信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_homepage)
---
---@param url string
---@return nil
function set_homepage(url) end

---
---**范围: xpack**
---
---设置标题信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_title)
---
---@param title string
---@return nil
function set_title(title) end

---
---**范围: xpack**
---
---设置详细描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_description)
---
---@param description string
---@return nil
function set_description(description) end

---
---**范围: xpack**
---
---设置作者信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_author)
---
---@param author string
---@return nil
function set_author(author) end

---
---**范围: xpack**
---
---设置维护者信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_maintainer)
---
---@param maintainer string
---@return nil
function set_maintainer(maintainer) end

---
---**范围: xpack**
---
---设置包的版权信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_copyright)
---
---@param copyright string
---@return nil
function set_copyright(copyright) end

---
---**范围: xpack**
---
---设置包的 License
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_license)
---
---@param license string
---@return nil
function set_license(license) end

---
---**范围: xpack**
---
---设置包的 License 文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_licensefile)
---
---@param file string
---@return nil
function set_licensefile(file) end

---
---**范围: xpack**
---
---设置包所属的公司
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_company)
---
---@param company string
---@return nil
function set_company(company) end

---
---**范围: xpack**
---
---设置打包的输入源类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_inputkind)
---
---@param kind "binary"|"source"
---@return nil
function set_inputkind(kind) end

---
---**范围: xpack**
---
---设置打包格式
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_formats)
---
---@param format XPackFormats
---@param ... XPackFormats
---@return nil
function set_formats(format, ...) end

---
---**范围: xpack**
---
---设置包文件名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_basename)
---
---@param name string
---@return nil
function set_basename(name) end

---
---**范围: xpack**
---
---设置安装包的扩展名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_extension)
---
---@param ext string
---@return nil
function set_extension(ext) end

---
---**范围: xpack**
---
---关联目标程序
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_targets)
---
---@param target string
---@param ... string
---@return nil
function add_targets(target, ...) end

---
---**范围: xpack**
---
---添加安装包组件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_components)
---
---@param component string
---@param ... string
---@return nil
function add_components(component, ...) end

---
---**范围: xpack**
---
---设置包的二进制安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_bindir)
---
---@param dir string
---@return nil
function set_bindir(dir) end

---
---**范围: xpack**
---
---设置包的库安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_libdir)
---
---@param dir string
---@return nil
function set_libdir(dir) end

---
---**范围: xpack**
---
---设置包的头文件安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_includedir)
---
---@param dir string
---@return nil
function set_includedir(dir) end

---
---**范围: xpack**
---
---设置包的安装前缀目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_prefixdir)
---
---@param dir string
---@return nil
function set_prefixdir(dir) end

---
---**范围: xpack**
---
---设置包 spec 文件路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_specfile)
---
---@param flie string
---@return nil
function set_specfile(flie) end

---
---**范围: xpack**
---
---设置包 spec 文件的自定义变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_specvar)
---
---@param key string
---@param value string
---@return nil
function set_specvar(key, value) end

---
---**范围: xpack**
---
---设置图标文件路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_iconfile)
---
---@param file string
---@return nil
function set_iconfile(file) end

---
---**范围: xpack**
---
---添加源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_sourcefiles)
---
---@param file string
---@param ... string
---@return nil
function add_sourcefiles(file, ...) end

---
---**范围: xpack**
---
---添加源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_sourcefiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_sourcefiles(file, opts) end

---
---**范围: xpack**
---
---添加二进制文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_installfiles)
---
---@param file string
---@param ... string
---@return nil
function add_installfiles(file, ...) end

---
---**范围: xpack**
---
---添加二进制文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_installfiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_installfiles(file, opts) end

---
---**范围: xpack**
---
---添加包的构建依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_buildrequires)
---
---@param pack string
---@param ... string
---@return nil
function add_buildrequires(pack, ...) end

---
---**范围: xpack**
---
---自定义加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_load)
---
---@param func XPackHook
---@return nil
function on_load(func) end

---
---**范围: xpack**
---
---自定义打包之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_package)
---
---@param func XPackHook
---@return nil
function before_package(func) end

---
---**范围: xpack**
---
---自定义打包脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_package)
---
---@param func XPackHook
---@return nil
function on_package(func) end

---
---**范围: xpack**
---
---自定义打包之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_package)
---
---@param func XPackHook
---@return nil
function after_package(func) end

---
---**范围: xpack**
---
---添加安装之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_installcmd)
---
---@param func XPackcmdHook
---@return nil
function before_installcmd(func) end

---
---**范围: xpack**
---
---自定义构建脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_buildcmd)
---
---@param func XPackcmdHook
---@return nil
function on_buildcmd(func) end

---
---**范围: xpack**
---
---自定义构建之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_buildcmd)
---
---@param func XPackcmdHook
---@return nil
function before_buildcmd(func) end

---
---**范围: xpack**
---
---自定义构建之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_buildcmd)
---
---@param func XPackcmdHook
---@return nil
function after_buildcmd(func) end

---
---**范围: xpack**
---
---自定义安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_installcmd)
---
---@param func XPackcmdHook
---@return nil
function on_installcmd(func) end

---
---**范围: xpack**
---
---添加安装之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_installcmd)
---
---@param func XPackcmdHook
---@return nil
function after_installcmd(func) end

---
---**范围: xpack**
---
---添加卸载之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_uninstallcmd)
---
---@param func XPackcmdHook
---@return nil
function before_uninstallcmd(func) end

---
---**范围: xpack**
---
---自定义卸载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_uninstallcmd)
---
---@param func XPackcmdHook
---@return nil
function on_uninstallcmd(func) end

---
---**范围: xpack**
---
---添加卸载之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_uninstallcmd)
---
---@param func XPackcmdHook
---@return nil
function after_uninstallcmd(func) end

---
---**范围: xpack**
---
---设置 NSIS 的显示图标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_nsis_displayicon)
---
---@param icon string
---@return nil
function set_nsis_displayicon(icon) end

---
---定义 XPack 组件
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function xpack_component(name, scope) end

---
---**范围: xpack_component**
---
---设置包组件的简单描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentset_title)
---
---@param title string
---@return nil
function set_title(title) end

---
---**范围: xpack_component**
---
---设置包组件的详细描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentset_description)
---
---@param description string
---@return nil
function set_description(description) end

---
---**范围: xpack_component**
---
---设置包组件的默认启用状态
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentset_default)
---
---@param enable boolean
---@return nil
function set_default(enable) end

---
---**范围: xpack_component**
---
---自定义加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componenton_load)
---
---@param func XPackComponentHook
---@return nil
function on_load(func) end

---
---**范围: xpack_component**
---
---添加组件安装之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentbefore_installcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function before_installcmd(func) end

---
---**范围: xpack_component**
---
---重写组件的安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componenton_installcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function on_installcmd(func) end

---
---**范围: xpack_component**
---
---添加组件安装之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentafter_installcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function after_installcmd(func) end

---
---**范围: xpack_component**
---
---添加组件卸载之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentbefore_uninstallcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function before_uninstallcmd(func) end

---
---**范围: xpack_component**
---
---重写组件卸载的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componenton_uninstallcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function on_uninstallcmd(func) end

---
---**范围: xpack_component**
---
---添加组件卸载之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentafter_uninstallcmd)
---
---@param func XPackComponencmdtHook
---@return nil
function after_uninstallcmd(func) end

---
---**范围: xpack_component**
---
---添加组件源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentadd_sourcefiles)
---
---@param file string
---@param ... string
---@return nil
function add_sourcefiles(file, ...) end

---
---**范围: xpack_component**
---
---添加组件源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentadd_sourcefiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_sourcefiles(file, opts) end

---
---**范围: xpack_component**
---
---添加组件二进制安装文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentadd_installfiles)
---
---@param file string
---@param ... string
---@return nil
function add_installfiles(file, ...) end

---
---**范围: xpack_component**
---
---添加组件二进制安装文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentadd_installfiles)
---
---@param file string
---@param opts { prefixdir: string }|table
---@return nil
function add_installfiles(file, opts) end
