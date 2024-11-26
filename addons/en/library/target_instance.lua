---@meta
---[target_instance](https://xmake.io/#/manual/target_instance)

---
---Get the name of the target
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetname)
---
---@param
---@return
function Target:name() end
                    
---
---Get the values of the target by name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetget)
---
---@param
---@return
function Target:get() end
                    
---
---Set the values of the target by name (If you just want to add values use [target:add](#targetadd))
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetset)
---
---@param
---@return
function Target:set() end
                    
---
---Add to the values of the target by name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetadd)
---
---@param
---@return
function Target:add() end
                    
---
---Get the target program type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetkind)
---
---@param
---@return
function Target:kind() end
                    
---
---Whether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_plat)
---
---@param
---@return
function Target:is_plat() end
                    
---
---Is the current platform android?
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_plat)
---
---@param
---@return
function Target:is_plat() end
                    
---
---Is the current platform windows, linux or macosx?
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_plat)
---
---@param
---@return
function Target:is_plat() end
                    
---
---Is the current architecture one of the given architectures
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_arch)
---
---@param
---@return
function Target:is_arch() end
                    
---
---Is the current architecture x86
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_arch)
---
---@param
---@return
function Target:is_arch() end
                    
---
---Is the current architecture x64 or x86_64
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetis_arch)
---
---@param
---@return
function Target:is_arch() end
                    
---
---Get the target file path
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targettargetfile)
---
---@param
---@return
function Target:targetfile() end
                    
---
---Get the output directory of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targettargetdir)
---
---@param
---@return
function Target:targetdir() end
                    
---
---Get the base name of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetbasename)
---
---@param
---@return
function Target:basename() end
                    
---
---Get the target file name
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetfilename)
---
---@param
---@return
function Target:filename() end
                    
---
---Get the installation directory of the target file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetinstalldir)
---
---@param
---@return
function Target:installdir() end
                    
---
---Get auto-generated catalog
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetautogendir)
---
---@param
---@return
function Target:autogendir() end
                    
---
---Get the object file path
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfile)
---
---@param
---@return
function Target:objectfile() end
                    
---
---Get all source files
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetsourcebatches)
---
---@param
---@return
function Target:sourcebatches() end
                    
---
---TODO
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetsourcebatches)
---
---@param
---@return
function Target:sourcebatches() end
                    
---
---Get a list of all object files
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetobjectfiles)
---
---@param
---@return
function Target:objectfiles() end
                    
---
---Get a list of all header files
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetheaderfiles)
---
---@param
---@return
function Target:headerfiles() end
                    
---
---TODO
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetheaderfiles)
---
---@param
---@return
function Target:headerfiles() end
                    
---
---Get the xmake.lua directory where the target definition is located
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetscriptdir)
---
---@param
---@return
function Target:scriptdir() end
                    
---
---Check whether the target compilation configuration can obtain the given C++ function
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxfuncs)
---
---@param
---@return
function Target:has_cxxfuncs() end
                    
---
---Check whether the target compilation configuration can obtain the given C type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_ctypes)
---
---@param
---@return
function Target:has_ctypes() end
                    
---
---Check whether the target compilation configuration can get the given C++ type
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxtypes)
---
---@param
---@return
function Target:has_cxxtypes() end
                    
---
---Check whether the target compilation configuration can obtain the given C compilation flags
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cflags)
---
---@param
---@return
function Target:has_cflags() end
                    
---
---Check whether the target compilation configuration can obtain the given C++ compilation flags
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxflags)
---
---@param
---@return
function Target:has_cxxflags() end
                    
---
---Check whether the target compilation configuration can obtain the given C header file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cincludes)
---
---@param
---@return
function Target:has_cincludes() end
                    
---
---Check whether the target compilation configuration can obtain the given C++ header file
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_cxxincludes)
---
---@param
---@return
function Target:has_cxxincludes() end
                    
---
---Detect whether a given piece of C code can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetcheck_csnippets)
---
---@param
---@return
function Target:check_csnippets() end
                    
---
---Detect if a given piece of C++ code can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetcheck_cxxsnippets)
---
---@param
---@return
function Target:check_cxxsnippets() end
                    
---
---Detect type size
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targetcheck_sizeof)
---
---@param
---@return
function Target:check_sizeof() end
                    
---
---Detect if specified C/C++ compiler feature
---
---[Open in browser](https://xmake.io/#/manual/target_instance?id=targethas_features)
---
---@param
---@return
function Target:has_features() end
                    