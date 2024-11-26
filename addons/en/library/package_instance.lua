---@meta
---[package_instance](https://xmake.io/#/manual/package_instance)

---
---Get the name of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagename)
---
---@param
---@return
function Package:name() end
                    
---
---Get the values of the package by name
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageget)
---
---@param
---@return
function Package:get() end
                    
---
---Set the values of the package by name (If you just want to add values use [package:add](#packageadd))
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageset)
---
---@param
---@return
function Package:set() end
                    
---
---Add to the values of the package by name
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageadd)
---
---@param
---@return
function Package:add() end
                    
---
---Get the license of the package (Same as `package:get("license")`)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagelicense)
---
---@param
---@return
function Package:license() end
                    
---
---Get the description of the package (Same as `package:get("description")`)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedescription)
---
---@param
---@return
function Package:description() end
                    
---
---Get the platform of the package. Can be any of:
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageplat)
---
---@param
---@return
function Package:plat() end
                    
---
---Get the architecture of the package (e.g. x86, x64, x86_64)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagearch)
---
---@param
---@return
function Package:arch() end
                    
---
---Get the targeted OS of the package. Can have the same values as [package:plat](#packageplat)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagetargetos)
---
---@param
---@return
function Package:targetos() end
                    
---
---Get the targeted architecture of the package. Can have the same values as [package:arch](#packagearch)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagetargetarch)
---
---@param
---@return
function Package:targetarch() end
                    
---
---Wether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_plat)
---
---@param
---@return
function Package:is_plat() end
                    
---
---Wether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_arch)
---
---@param
---@return
function Package:is_arch() end
                    
---
---Wether the currently targeted OS is one of the given OS
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_targetos)
---
---@param
---@return
function Package:is_targetos() end
                    
---
---Wether the currently targeted architecture is one of the given architectures
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_targetarch)
---
---@param
---@return
function Package:is_targetarch() end
                    
---
---Get the alias of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagealias)
---
---@param
---@return
function Package:alias() end
                    
---
---Get the URLs of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageurls)
---
---@param
---@return
function Package:urls() end
                    
---
---Get a dependency of the package by name. The name needs to be a dependency of the package.
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedep)
---
---@param
---@return
function Package:dep() end
                    
---
---Get all dependencies of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedeps)
---
---@param
---@return
function Package:deps() end
                    
---
---Get the sha256 checksum of an URL alias
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagesourcehash)
---
---@param
---@return
function Package:sourcehash() end
                    
---
---Get the kind of the package. Can be any of:
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagekind)
---
---@param
---@return
function Package:kind() end
                    
---
---Wether the package is of kind binary
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_binary)
---
---@param
---@return
function Package:is_binary() end
                    
---
---Wether the package is of kind toolchain
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_toolchain)
---
---@param
---@return
function Package:is_toolchain() end
                    
---
---Wether the package is of kind library
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_library)
---
---@param
---@return
function Package:is_library() end
                    
---
---Wether the package is directly required by the user (e.g. xmake.lua)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_toplevel)
---
---@param
---@return
function Package:is_toplevel() end
                    
---
---Wether the package is provided by a thirdparty package manager (e.g. brew, conan, vcpkg)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_thirdparty)
---
---@param
---@return
function Package:is_thirdparty() end
                    
---
---Wether the package is build with debug mode (Same as `package:config("debug")`)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_debug)
---
---@param
---@return
function Package:is_debug() end
                    
---
---Wether the package is supported by the current platform and architecture
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_supported)
---
---@param
---@return
function Package:is_supported() end
                    
---
---Wether the the package gets built with debug mode (deprecated: use [`package:is_debug`](#packageis_debug) instead)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedebug)
---
---@param
---@return
function Package:debug() end
                    
---
---Wether the package is getting cross-compiled
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_cross)
---
---@param
---@return
function Package:is_cross() end
                    
---
---Get the cache directory of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecachedir)
---
---@param
---@return
function Package:cachedir() end
                    
---
---Get the installation directory of the package. Can also be used to get a subdirectory. If the given directory tree does not exist it will be created.
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageinstalldir)
---
---@param
---@return
function Package:installdir() end
                    
---
---Get the directory where the xmake.lua of the package lies
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagescriptdir)
---
---@param
---@return
function Package:scriptdir() end
                    
---
---Get the exported environment variables of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageenvs)
---
---@param
---@return
function Package:envs() end
                    
---
---Get the given environment variable
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagegetenv)
---
---@param
---@return
function Package:getenv() end
                    
---
---Set the given environment variable. Overwrites the variable
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagesetenv)
---
---@param
---@return
function Package:setenv() end
                    
---
---Add the given values to the environment variable
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageaddenv)
---
---@param
---@return
function Package:addenv() end
                    
---
---Get all version strings of the package. Returns a table containing all versions as strings
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageversions)
---
---@param
---@return
function Package:versions() end
                    
---
---Get the version of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageversion)
---
---@param
---@return
function Package:version() end
                    
---
---Get the version of the package as string
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageversion_str)
---
---@param
---@return
function Package:version_str() end
                    
---
---Get the given configuration value of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageconfig)
---
---@param
---@return
function Package:config() end
                    
---
---Set the given configuration value of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageconfig_set)
---
---@param
---@return
function Package:config_set() end
                    
---
---Get all configurations of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageconfigs)
---
---@param
---@return
function Package:configs() end
                    
---
---Get the build hash of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagebuildhash)
---
---@param
---@return
function Package:buildhash() end
                    
---
---Get all patches of the current version
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagepatches)
---
---@param
---@return
function Package:patches() end
                    
---
---Wether the package has the given C functions
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cfuncs)
---
---@param
---@return
function Package:has_cfuncs() end
                    
---
---Wether the package has the given C++ functions
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxfuncs)
---
---@param
---@return
function Package:has_cxxfuncs() end
                    
---
---Wether the package has the given C types
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_ctypes)
---
---@param
---@return
function Package:has_ctypes() end
                    
---
---Wether the package has the given C++ types
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxtypes)
---
---@param
---@return
function Package:has_cxxtypes() end
                    
---
---Wether the package has the given C header files
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cincludes)
---
---@param
---@return
function Package:has_cincludes() end
                    
---
---Wether the package has the given C++ header files
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxincludes)
---
---@param
---@return
function Package:has_cxxincludes() end
                    
---
---Wether the given C snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecheck_csnippets)
---
---@param
---@return
function Package:check_csnippets() end
                    
---
---Wether the given C++ snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecheck_cxxsnippets)
---
---@param
---@return
function Package:check_cxxsnippets() end
                    
---
---Wether the given Fortran snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecheck_fcsnippets)
---
---@param
---@return
function Package:check_fcsnippets() end
                    