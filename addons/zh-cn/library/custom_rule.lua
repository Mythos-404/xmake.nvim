---@meta
---[custom_rule](https://xmake.io/#/zh-cn/manual/custom_rule)

---
---定义规则
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rule)
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function rule(name, scope) end

---
---**范围: rule**
---
---添加规则依赖
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleadd_deps)
---
---@param rule string
---@param opts { order: boolean } 是否按顺序执行
---@return nil
function add_deps(rule, opts) end

---
---**范围: rule**
---
---为所有自定义脚本预先导入扩展模块
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleadd_imports)
---
---@param module string
---@param opts? { rootdir: string, alias: string, inherit: boolean }
---@return nil
function add_imports(module, opts) end

---
---**范围: rule**
---
---设置规则支持的文件扩展类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleset_extensions)
---
---@param ext string
---@param ... string
---@return nil
function set_extensions(ext, ...) end

---
---**范围: rule**
---
---自定义加载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_load)
---
---@param func TargetHook
---@return nil
function on_load(func) end

---
---**范围: rule**
---
---自定义链接脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_link)
---
---@param func TargetHook
---@return nil
function on_link(func) end

---
---**范围: rule**
---
---自定义配置脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_config)
---
---@param func TargetHook
---@return nil
function on_config(func) end

---
---**范围: rule**
---
---自定义编译脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_build)
---
---@param func TargetHook
---@return nil
function on_build(func) end

---
---**范围: rule**
---
---自定义清理脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_clean)
---
---@param func TargetHook
---@return nil
function on_clean(func) end

---
---**范围: rule**
---
---自定义打包脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_package)
---
---@param func TargetHook
---@return nil
function on_package(func) end

---
---**范围: rule**
---
---自定义安装脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_install)
---
---@param func TargetHook
---@return nil
function on_install(func) end

---
---**范围: rule**
---
---自定义卸载脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_uninstall)
---
---@param func TargetHook
---@return nil
function on_uninstall(func) end

---
---**范围: rule**
---
---自定义编译脚本，一次处理一个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function on_build_file(func) end

---
---**范围: rule**
---
---自定义批处理编译脚本，一次处理一个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_buildcmd_file)
---
---@param func TargetBuildcmdFileHook
---@return nil
function on_buildcmd_file(func) end

---
---**范围: rule**
---
---自定义编译脚本，一次处理多个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function on_build_files(func) end

---
---**范围: rule**
---
---自定义批处理编译脚本，一次处理多个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleon_buildcmd_files)
---
---@param func TargetBuildcmdFilesHook
---@return nil
function on_buildcmd_files(func) end

---
---**范围: rule**
---
---自定义链接前脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_link)
---
---@param func TargetHook
---@return nil
function before_link(func) end

---
---**范围: rule**
---
---自定义编译前脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_build)
---
---@param func TargetHook
---@return nil
function before_build(func) end

---
---**范围: rule**
---
---自定义清理前脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_clean)
---
---@param func TargetHook
---@return nil
function before_clean(func) end

---
---**范围: rule**
---
---自定义打包前脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_package)
---
---@param func TargetHook
---@return nil
function before_package(func) end

---
---**范围: rule**
---
---自定义安装前脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_install)
---
---@param func TargetHook
---@return nil
function before_install(func) end

---
---**范围: rule**
---
---自定义卸载前脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_uninstall)
---
---@param func TargetHook
---@return nil
function before_uninstall(func) end

---
---**范围: rule**
---
---自定义编译前脚本，一次处理一个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function before_build_file(func) end

---
---**范围: rule**
---
---自定义编译前批处理脚本，一次处理一个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_buildcmd_file)
---
---@param func TargetBuildcmdFileHook
---@return nil
function before_buildcmd_file(func) end

---
---**范围: rule**
---
---自定义编译前脚本，一次处理多个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function before_build_files(func) end

---
---**范围: rule**
---
---自定义编译前批处理脚本，一次处理多个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rulebefore_buildcmd_files)
---
---@param func TargetBuildcmdFilesHook
---@return nil
function before_buildcmd_files(func) end

---
---**范围: rule**
---
---自定义链接后脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_link)
---
---@param func TargetHook
---@return nil
function after_link(func) end

---
---**范围: rule**
---
---自定义编译后脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_build)
---
---@param func TargetHook
---@return nil
function after_build(func) end

---
---**范围: rule**
---
---自定义清理后脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_clean)
---
---@param func TargetHook
---@return nil
function after_clean(func) end

---
---**范围: rule**
---
---自定义打包后脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_package)
---
---@param func TargetHook
---@return nil
function after_package(func) end

---
---**范围: rule**
---
---自定义安装后脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_install)
---
---@param func TargetHook
---@return nil
function after_install(func) end

---
---**范围: rule**
---
---自定义卸载后脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_uninstall)
---
---@param func TargetHook
---@return nil
function after_uninstall(func) end

---
---**范围: rule**
---
---自定义编译后脚本，一次处理一个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function after_build_file(func) end

---
---**范围: rule**
---
---自定义编译后批处理脚本，一次处理一个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_buildcmd_file)
---
---@param func TargetBuildcmdFileHook
---@return nil
function after_buildcmd_file(func) end

---
---**范围: rule**
---
---自定义编译后脚本，一次处理多个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function after_build_files(func) end

---
---**范围: rule**
---
---自定义编译后批处理脚本，一次处理多个源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=ruleafter_buildcmd_files)
---
---@param func TargetBuildcmdFilesHook
---@return nil
function after_buildcmd_files(func) end

---
---结束定义规则
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/custom_rule?id=rule_end)
---
---@return nil
function rule_end() end
