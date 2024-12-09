---@meta
---[target_instance](https://xmake.io/#/manual/target_instance)

---@class Target
local Target = {}

---
---Get the name of the target
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetname)
---
---@return nil
function Target:name() end

---
---Get the values of the target by name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetget)
---
---@param key string
---@return string
function Target:get(key) end

---
---Set the values of the target by name (If you just want to add values use [target:add](#targetadd))
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetset)
---
---@param key string
---@param value string
---@return nil
function Target:set(key, value) end

---
---Add to the values of the target by name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetadd)
---
---@param key string
---@param value string
---@return nil
function Target:add(key, value) end

---
---Get the target program type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetkind)
---
---@return TargetKind
function Target:kind() end

---
---Whether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_plat)
---
---@param plat Platform
---@param ... Platform
---@return boolean
function Target:is_plat(plat, ...) end

---
---Is the current architecture one of the given architectures
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_arch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function Target:is_arch(arch, ...) end

---
---Get the target file path
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targettargetfile)
---
---@return string
function Target:targetfile() end

---
---Get the output directory of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targettargetdir)
---
---@return string
function Target:targetdir() end

---
---Get the base name of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetbasename)
---
---@return string
function Target:basename() end

---
---Get the target file name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetfilename)
---
---@return string
function Target:filename() end

---
---Get the installation directory of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetinstalldir)
---
---@return string
function Target:installdir() end

---
---Get auto-generated catalog
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetautogendir)
---
---@return string
function Target:autogendir() end

---
---Get the object file path
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfile)
---
---@param srcfile string
---@return string
function Target:objectfile(srcfile) end

---
---Get all source files
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetsourcebatches)
---
---@return { [string]: SourceBatch }
function Target:sourcebatches() end

---
---Get a list of all object files
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfiles)
---
---@return string[]
function Target:objectfiles() end

---
---Get a list of all header files
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetheaderfiles)
---
---@return string[]
function Target:headerfiles() end

---
---Get the xmake.lua directory where the target definition is located
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetscriptdir)
---
---@return string
function Target:scriptdir() end

---
---Check whether the target compilation configuration can obtain the given C function
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cfuncs(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C function
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_cfuncs(name, opts) end

---
---Check whether the target compilation configuration can obtain the given C++ function
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxfuncs(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C++ function
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_cxxfuncs(name, opts) end

---
---Check whether the target compilation configuration can obtain the given C type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_ctypes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_ctypes(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_ctypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_ctypes(name, opts) end

---
---Check whether the target compilation configuration can get the given C++ type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxtypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Target:has_cxxtypes(name, opts) end

---
---Check whether the target compilation configuration can get the given C++ type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxtypes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxtypes(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C compilation flags
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cflags)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cflags(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxflags)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxflags(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C header file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cincludes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cincludes(name, ...) end

---
---Check whether the target compilation configuration can obtain the given C++ header file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxincludes)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_cxxincludes(name, ...) end

---
---Detect whether a given piece of C code can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetcheck_csnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Target:check_csnippets(snippet, ...) end

---
---Detect if a given piece of C++ code can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetcheck_cxxsnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Target:check_cxxsnippets(snippet, ...) end

---
---Detect type size
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetcheck_sizeof)
---
---@param name string
---@return boolean
function Target:check_sizeof(name) end

---
---Detect if specified C/C++ compiler feature
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_features)
---
---@param name string
---@param ... string
---@return boolean
function Target:has_features(name, ...) end
