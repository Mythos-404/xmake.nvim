---@meta
---[custom_rule](https://xmake.io/#/manual/custom_rule)

---
---Defining rules
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rule)
---
---@param name string
---@param scope? ScopeSyntax Scope syntax
---@return nil
function rule(name, scope) end

---
---**Scoped: rule**
---
---Adding rule dependencies
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleadd_deps)
---
---@param rule string
---@param opts { order: boolean } Whether to execute in order
---@return nil
function add_deps(rule, opts) end

---
---**Scoped: rule**
---
---Add imported modules for all custom scripts
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleadd_imports)
---
---@param module string
---@param opts? { rootdir: string, alias: string, inherit: boolean }
---@return nil
function add_imports(module, opts) end

---
---**Scoped: rule**
---
---Setting the file extension type supported by the rule
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleset_extensions)
---
---@param ext string
---@param ... string
---@return nil
function set_extensions(ext, ...) end

---
---**Scoped: rule**
---
---Custom load script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_load)
---
---@param func TargetHook
---@return nil
function on_load(func) end

---
---**Scoped: rule**
---
---Custom link script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_link)
---
---@param func TargetHook
---@return nil
function on_link(func) end

---
---**Scoped: rule**
---
---custom configuration script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_config)
---
---@param func TargetHook
---@return nil
function on_config(func) end

---
---**Scoped: rule**
---
---Custom compilation script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_build)
---
---@param func TargetHook
---@return nil
function on_build(func) end

---
---**Scoped: rule**
---
---Custom cleanup script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_clean)
---
---@param func TargetHook
---@return nil
function on_clean(func) end

---
---**Scoped: rule**
---
---Custom packaging script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_package)
---
---@param func TargetHook
---@return nil
function on_package(func) end

---
---**Scoped: rule**
---
---Custom installation script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_install)
---
---@param func TargetHook
---@return nil
function on_install(func) end

---
---**Scoped: rule**
---
---Custom Uninstall Script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_uninstall)
---
---@param func TargetHook
---@return nil
function on_uninstall(func) end

---
---**Scoped: rule**
---
---Customizing the build script to process one source file at a time
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function on_build_file(func) end

---
---**Scoped: rule**
---
---Custom batch compile script, process one source file at a time
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_buildcmd_file)
---
---@param func TargetBuildcmdFileHook
---@return nil
function on_buildcmd_file(func) end

---
---**Scoped: rule**
---
---Customizing the build script to process multiple source files at once
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function on_build_files(func) end

---
---**Scoped: rule**
---
---Customize batch compiling script, process multiple source files at once
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleon_buildcmd_files)
---
---@param func TargetBuildcmdFilesHook
---@return nil
function on_buildcmd_files(func) end

---
---**Scoped: rule**
---
---Custom pre-link script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_link)
---
---@param func TargetHook
---@return nil
function before_link(func) end

---
---**Scoped: rule**
---
---Custom pre-compilation script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_build)
---
---@param func TargetHook
---@return nil
function before_build(func) end

---
---**Scoped: rule**
---
---Custom pre-cleanup script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_clean)
---
---@param func TargetHook
---@return nil
function before_clean(func) end

---
---**Scoped: rule**
---
---Custom the pre-package script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_package)
---
---@param func TargetHook
---@return nil
function before_package(func) end

---
---**Scoped: rule**
---
---Custom pre-installation script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_install)
---
---@param func TargetHook
---@return nil
function before_install(func) end

---
---**Scoped: rule**
---
---Custom pre-uninstall script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_uninstall)
---
---@param func TargetHook
---@return nil
function before_uninstall(func) end

---
---**Scoped: rule**
---
---Custom pre-compilation script to process one source file at a time
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function before_build_file(func) end

---
---**Scoped: rule**
---
---Customize the pre-compilation batch script, process one source file at a time
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_buildcmd_file)
---
---@param func TargetBuildcmdFileHook
---@return nil
function before_buildcmd_file(func) end

---
---**Scoped: rule**
---
---Customize pre-compilation scripts to process multiple source files at once
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function before_build_files(func) end

---
---**Scoped: rule**
---
---Customize the pre-compilation batch script to process multiple source files at once
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rulebefore_buildcmd_files)
---
---@param func TargetBuildcmdFilesHook
---@return nil
function before_buildcmd_files(func) end

---
---**Scoped: rule**
---
---Custom post-linking script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_link)
---
---@param func TargetHook
---@return nil
function after_link(func) end

---
---**Scoped: rule**
---
---Custom post-compilation script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_build)
---
---@param func TargetHook
---@return nil
function after_build(func) end

---
---**Scoped: rule**
---
---Custom post-cleaning script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_clean)
---
---@param func TargetHook
---@return nil
function after_clean(func) end

---
---**Scoped: rule**
---
---Custom post-packaging script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_package)
---
---@param func TargetHook
---@return nil
function after_package(func) end

---
---**Scoped: rule**
---
---Custom post-installation script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_install)
---
---@param func TargetHook
---@return nil
function after_install(func) end

---
---**Scoped: rule**
---
---Custom post-uninstallation Script
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_uninstall)
---
---@param func TargetHook
---@return nil
function after_uninstall(func) end

---
---**Scoped: rule**
---
---Custom post-compilation scripts to process one source file at a time
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_build_file)
---
---@param func TargetBuildFileHook
---@return nil
function after_build_file(func) end

---
---**Scoped: rule**
---
---Customize the compiled batch script, process one source file at a time
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_buildcmd_file)
---
---@param func TargetBuildcmdFileHook
---@return nil
function after_buildcmd_file(func) end

---
---**Scoped: rule**
---
---Customize the compiled script to process multiple source files at once
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_build_files)
---
---@param func TargetBuildFilesHook
---@return nil
function after_build_files(func) end

---
---**Scoped: rule**
---
---Customize the compiled batch script to process multiple source files at once
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=ruleafter_buildcmd_files)
---
---@param func TargetBuildcmdFilesHook
---@return nil
function after_buildcmd_files(func) end

---
---End definition rules
---
---[Open in browser](https://xmake.io/#/manual/custom_rule?id=rule_end)
---
---@return nil
function rule_end() end
