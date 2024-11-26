---@meta
---[configuration_option](https://xmake.io/#/zh-cn/manual/configuration_option)

---
---定义选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=option)
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function option(name, scope) end

---
---结束定义选项
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=option_end)
---
---@return nil
function option_end() end

---
---**范围: option**
---
---添加选项依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_deps)
---
---@param option string 根据选项名称
---@param ... string 根据选项名称
---@return nil
function add_deps(option, ...) end

---
---**范围: option**
---
---选项检测之前执行此脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionbefore_check)
---
---@param func fun(option: Option): nil
---@return nil
function before_check(func) end

---
---**范围: option**
---
---自定义选项检测脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionon_check)
---
---@param func fun(option: Option): nil
---@return nil
function on_check(func) end

---
---**范围: option**
---
---选项检测之后执行此脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionafter_check)
---
---@param func fun(option: Option): nil
---@return nil
function after_check(func) end

---
---**范围: option**
---
---设置选项值列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optset_values)
---
---@param value string
---@param ... string
---@return nil
function set_values(value, ...) end

---
---**范围: option**
---
---设置选项默认值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optset_default)
---
---@param default string|boolean
---@return nil
function set_default(default) end

---
---**范围: option**
---
---设置是否启用菜单显示
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optset_showmenu)
---
---@param enabled boolean
---@return nil
function set_showmenu(enabled) end

---
---**范围: option**
---
---设置选项分类，仅用于菜单显示
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optset_category)
---
---@param name string 分组名称
---@return nil
function set_category(name) end

---
---**范围: option**
---
---设置菜单显示描述
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optset_description)
---
---@param description string
---@param ... string 多行描述
---@return nil
function set_description(description, ...) end

---
---**范围: option**
---
---添加链接库检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_links)
---
---@param link string
---@param ... string
---@return nil
function add_links(link, ...) end

---
---**范围: option**
---
---添加链接库检测时候需要的搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_linkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_linkdirs(dir, ...) end

---
---**范围: option**
---
---添加程序运行时动态库的加载搜索目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_rpathdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_rpathdirs(dir, ...) end

---
---**范围: option**
---
---添加c头文件检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_cincludes)
---
---@param name string
---@param ... string
---@return nil
function add_cincludes(name, ...) end

---
---**范围: option**
---
---添加c++头文件检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_cxxincludes)
---
---@param name string
---@param ... string
---@return nil
function add_cxxincludes(name, ...) end

---
---**范围: option**
---
---添加c类型检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_ctypes)
---
---@param type string
---@param ... string
---@return nil
function add_ctypes(type, ...) end

---
---**范围: option**
---
---添加c++类型检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_cxxtypes)
---
---@param type string
---@param ... string
---@return nil
function add_cxxtypes(type, ...) end

---
---**范围: option**
---
---添加c代码片段检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_csnippets)
---
---@param name string
---@param snippet string
---@param opts? {tryrun: boolean, output: boolean}|table
---@return nil
function add_csnippets(name, snippet, opts) end

---
---**范围: option**
---
---添加c++代码片段检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_cxxsnippets)
---
---@param name string
---@param snippet string
---@param opts? {tryrun: boolean, output: boolean}|table
---@return nil
function add_cxxsnippets(name, snippet, opts) end

---
---**范围: option**
---
---添加c库函数检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_cfuncs)
---
---@param code string
---@param ... string
---@return nil
function add_cfuncs(code, ...) end

---
---**范围: option**
---
---添加c++库函数检测
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/configuration_option?id=optionadd_cxxfuncs)
---
---@param code string
---@param ... string
---@return nil
function add_cxxfuncs(code, ...) end
