---@meta
---[xpack](https://xmake.io/#/zh-cn/manual/xpack)

---
---**范围: xpack**
---
---设置包版本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_version)
---
---@param
---@return
function set_version() end

---
---**范围: xpack**
---
---设置主页信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_homepage)
---
---@param
---@return
function set_homepage() end

---
---**范围: xpack**
---
---设置标题信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_title)
---
---@param
---@return
function set_title() end

---
---**范围: xpack**
---
---设置详细描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_description)
---
---@param
---@return
function set_description() end

---
---**范围: xpack**
---
---设置作者信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_author)
---
---@param
---@return
function set_author() end

---
---**范围: xpack**
---
---设置维护者信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_maintainer)
---
---@param
---@return
function set_maintainer() end

---
---**范围: xpack**
---
---设置包的版权信息
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_copyright)
---
---@param
---@return
function set_copyright() end

---
---**范围: xpack**
---
---设置包的 License
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_license)
---
---@param
---@return
function set_license() end

---
---**范围: xpack**
---
---设置包的 License 文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_licensefile)
---
---@param
---@return
function set_licensefile() end

---
---**范围: xpack**
---
---设置包所属的公司
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_company)
---
---@param
---@return
function set_company() end

---
---**范围: xpack**
---
---设置打包的输入源类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_inputkind)
---
---@param
---@return
function set_inputkind() end

---
---**范围: xpack**
---
---设置打包格式
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_formats)
---
---@param
---@return
function set_formats() end

---
---**范围: xpack**
---
---设置包文件名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_basename)
---
---@param
---@return
function set_basename() end

---
---**范围: xpack**
---
---设置安装包的扩展名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_extension)
---
---@param
---@return
function set_extension() end

---
---**范围: xpack**
---
---关联目标程序
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_targets)
---
---@param
---@return
function add_targets() end

---
---**范围: xpack**
---
---添加安装包组件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_components)
---
---@param
---@return
function add_components() end

---
---**范围: xpack**
---
---设置包的二进制安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_bindir)
---
---@param
---@return
function set_bindir() end

---
---**范围: xpack**
---
---设置包的库安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_libdir)
---
---@param
---@return
function set_libdir() end

---
---**范围: xpack**
---
---设置包的头文件安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_includedir)
---
---@param
---@return
function set_includedir() end

---
---**范围: xpack**
---
---设置包的安装前缀目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_prefixdir)
---
---@param
---@return
function set_prefixdir() end

---
---**范围: xpack**
---
---设置包 spec 文件路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_specfile)
---
---@param
---@return
function set_specfile() end

---
---**范围: xpack**
---
---设置包 spec 文件的自定义变量
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_specvar)
---
---@param
---@return
function set_specvar() end

---
---**范围: xpack**
---
---设置图标文件路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_iconfile)
---
---@param
---@return
function set_iconfile() end

---
---**范围: xpack**
---
---添加源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_sourcefiles)
---
---@param
---@return
function add_sourcefiles() end

---
---**范围: xpack**
---
---添加二进制文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_installfiles)
---
---@param
---@return
function add_installfiles() end

---
---**范围: xpack**
---
---添加包的构建依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackadd_buildrequires)
---
---@param
---@return
function add_buildrequires() end

---
---**范围: xpack**
---
---自定义加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_load)
---
---@param
---@return
function on_load() end

---
---**范围: xpack**
---
---自定义打包之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_package)
---
---@param
---@return
function before_package() end

---
---**范围: xpack**
---
---自定义打包脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_package)
---
---@param
---@return
function on_package() end

---
---**范围: xpack**
---
---自定义打包之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_package)
---
---@param
---@return
function after_package() end

---
---**范围: xpack**
---
---添加安装之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_installcmd)
---
---@param
---@return
function before_installcmd() end

---
---**范围: xpack**
---
---自定义构建脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_buildcmd)
---
---@param
---@return
function on_buildcmd() end

---
---**范围: xpack**
---
---自定义构建之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_buildcmd)
---
---@param
---@return
function before_buildcmd() end

---
---**范围: xpack**
---
---自定义构建之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_buildcmd)
---
---@param
---@return
function after_buildcmd() end

---
---**范围: xpack**
---
---自定义安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_installcmd)
---
---@param
---@return
function on_installcmd() end

---
---**范围: xpack**
---
---添加安装之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_installcmd)
---
---@param
---@return
function after_installcmd() end

---
---**范围: xpack**
---
---添加卸载之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackbefore_uninstallcmd)
---
---@param
---@return
function before_uninstallcmd() end

---
---**范围: xpack**
---
---自定义卸载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackon_uninstallcmd)
---
---@param
---@return
function on_uninstallcmd() end

---
---**范围: xpack**
---
---添加卸载之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackafter_uninstallcmd)
---
---@param
---@return
function after_uninstallcmd() end

---
---**范围: xpack**
---
---设置 NSIS 的显示图标
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpackset_nsis_displayicon)
---
---@param
---@return
function set_nsis_displayicon() end

---
---**范围: xpack_component**
---
---设置包组件的简单描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentset_title)
---
---@param
---@return
function set_title() end

---
---**范围: xpack_component**
---
---设置包组件的详细描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentset_description)
---
---@param
---@return
function set_description() end

---
---**范围: xpack_component**
---
---设置包组件的默认启用状态
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentset_default)
---
---@param
---@return
function set_default() end

---
---**范围: xpack_component**
---
---自定义加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componenton_load)
---
---@param
---@return
function on_load() end

---
---**范围: xpack_component**
---
---添加组件安装之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentbefore_installcmd)
---
---@param
---@return
function before_installcmd() end

---
---**范围: xpack_component**
---
---重写组件的安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componenton_installcmd)
---
---@param
---@return
function on_installcmd() end

---
---**范围: xpack_component**
---
---添加组件安装之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentafter_installcmd)
---
---@param
---@return
function after_installcmd() end

---
---**范围: xpack_component**
---
---添加组件卸载之前的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentbefore_uninstallcmd)
---
---@param
---@return
function before_uninstallcmd() end

---
---**范围: xpack_component**
---
---重写组件卸载的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componenton_uninstallcmd)
---
---@param
---@return
function on_uninstallcmd() end

---
---**范围: xpack_component**
---
---添加组件卸载之后的脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentafter_uninstallcmd)
---
---@param
---@return
function after_uninstallcmd() end

---
---**范围: xpack_component**
---
---添加组件源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentadd_sourcefiles)
---
---@param
---@return
function add_sourcefiles() end

---
---**范围: xpack_component**
---
---添加组件二进制安装文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/xpack?id=xpack_componentadd_installfiles)
---
---@param
---@return
function add_installfiles() end
