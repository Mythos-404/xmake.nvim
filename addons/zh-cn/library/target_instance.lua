---@meta
---[target_instance](https://xmake.io/#/zh-cn/manual/target_instance)

---@class Target
local Target = {}

---
---获取目标的名字
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetname)
---
---@return nil
function Target:name() end

---
---获取目标在描述域的配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetget)
---
---@param key string
---@return string
function Target:get(key) end

---
---设置目标的配置值，（如果你想添加值可以用 **Target:add()**）。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetset)
---
---@param key string
---@param value string
---@return nil
function Target:set(key, value) end

---
---按名称添加到目标的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetadd)
---
---@param key string
---@param value string
---@return nil
function Target:add(key, value) end

---
---获取目标程序类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetkind)
---
---@return TargetKind
function Target:kind() end

---
---当前平台是否是给定平台之一
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetis_plat)
---
---@param plat Platform
---@param ... Platform
---@return boolean
function Target:is_plat(plat, ...) end

---
---当前架构是否是给定架构之一
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetis_arch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function Target:is_arch(arch, ...) end

---
---获取目标文件路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targettargetfile)
---
---@return string
function Target:targetfile() end

---
---获取目标文件的输出目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targettargetdir)
---
---@return string
function Target:targetdir() end

---
---获取目标文件的 base 名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetbasename)
---
---@return string
function Target:basename() end

---
---获取目标文件名
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetfilename)
---
---@return string
function Target:filename() end

---
---获取目标文件的安装目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetinstalldir)
---
---@return string
function Target:installdir() end

---
---获取自动生成目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetautogendir)
---
---@return string
function Target:autogendir() end

---
---获取对象文件路径
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetobjectfile)
---
---@param srcfile string
---@return string
function Target:objectfile(srcfile) end

---
---获取所有源文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetsourcebatches)
---
---@return { [string]: SourceBatch }
function Target:sourcebatches() end

---
---获取所有对象文件列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetobjectfiles)
---
---@return string[]
function Target:objectfiles() end

---
---获取所有的头文件列表
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetheaderfiles)
---
---@return string[]
function Target:headerfiles() end

---
---获取目标定义所在的 xmake.lua 目录
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetscriptdir)
---
---@return string
function Target:scriptdir() end

---
---检测目标编译配置能否获取给定的 C 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cfuncs(name, ...) end

---
---检测目标编译配置能否获取给定的 C 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_cfuncs(name, opts) end

---
---检测目标编译配置能否获取给定的 C++ 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cxxfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxfuncs(name, ...) end

---
---检测目标编译配置能否获取给定的 C++ 函数
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cxxfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_cxxfuncs(name, opts) end

---
---检测目标编译配置能否获取给定的 C 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_ctypes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_ctypes(name, ...) end

---
---检测目标编译配置能否获取给定的 C 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_ctypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_ctypes(name, opts) end

---
---检测目标编译配置能否获取给定的 C++ 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cxxtypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_cxxtypes(name, opts) end

---
---检测目标编译配置能否获取给定的 C++ 类型
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cxxtypes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxtypes(name, ...) end

---
---检测目标编译配置能否获取给定的 C 编译 flags
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cflags)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cflags(name, ...) end

---
---检测目标编译配置能否获取给定的 C++ 编译 flags
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cxxflags)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxflags(name, ...) end

---
---检测目标编译配置能否获取给定的 C 头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cincludes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cincludes(name, ...) end

---
---检测目标编译配置能否获取给定的 C++ 头文件
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_cxxincludes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxincludes(name, ...) end

---
---检测是否可以编译和链接给定的 C 代码片段
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetcheck_csnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Target:check_csnippets(snippet, ...) end

---
---检测是否可以编译和链接给定的 C++ 代码片段
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetcheck_cxxsnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Target:check_cxxsnippets(snippet, ...) end

---
---检测类型大小
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targetcheck_sizeof)
---
---@param name string
---@return boolean
function Target:check_sizeof(name) end

---
---检测是否指定的 C/C++ 编译特性
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/target_instance?id=targethas_features)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_features(name, ...) end
