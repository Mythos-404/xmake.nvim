---@meta
---[package_instance](https://xmake.io/#/manual/package_instance)

---@class Package
local Package = {}

---
---Get the name of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagename)
---
---@return string
function Package:name() end

---
---Get the values of the package by name
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageget)
---
---@param key string
---@return string
function Package:get(key) end

---
---Set the values of the package by name (If you just want to add values use [package:add](#packageadd))
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageset)
---
---@param key string
---@param value string
---@return nil
function Package:set(key, value) end

---
---Add to the values of the package by name
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageadd)
---
---@param key string
---@param value string
---@return nil
function Package:add(key, value) end

---
---Get the license of the package (Same as `package:get("license")`)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagelicense)
---
---@return string
function Package:license() end

---
---Get the description of the package (Same as `package:get("description")`)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedescription)
---
---@return string
function Package:description() end

---
---Get the platform of the package. Can be any of:
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageplat)
---
---@return PackagePlatform
function Package:plat() end

---
---Get the architecture of the package (e.g. x86, x64, x86_64)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagearch)
---
---@return Architecture
function Package:arch() end

---
---Get the targeted OS of the package. Can have the same values as [package:plat](#packageplat)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagetargetos)
---
---@return PackagePlatform
function Package:targetos() end

---
---Get the targeted architecture of the package. Can have the same values as [package:arch](#packagearch)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagetargetarch)
---
---@return Architecture
function Package:targetarch() end

---
---Wether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_plat)
---
---@param plat PackagePlatform
---@param ... PackagePlatform
---@return boolean
function Package:is_plat(plat, ...) end

---
---Wether the current platform is one of the given platforms
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_arch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function Package:is_arch(arch, ...) end

---
---Wether the currently targeted OS is one of the given OS
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_targetos)
---
---@param plat PackagePlatform
---@param ... PackagePlatform
---@return boolean
function Package:is_targetos(plat, ...) end

---
---Wether the currently targeted architecture is one of the given architectures
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_targetarch)
---
---@param arch Architecture
---@param ... Architecture
---@return boolean
function Package:is_targetarch(arch, ...) end

---
---Get the alias of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagealias)
---
---@return string
function Package:alias() end

---
---Get the URLs of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageurls)
---
---@return string[]
function Package:urls() end

---
---Get a dependency of the package by name. The name needs to be a dependency of the package.
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedep)
---
---@param name string
---@return Package
function Package:dep(name) end

---
---Get all dependencies of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagedeps)
---
---@return { [string]: Package }
function Package:deps() end

---
---Get the sha256 checksum of an URL alias
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagesourcehash)
---
---@param name string
---@return string
function Package:sourcehash(name) end

---
---Get the kind of the package. Can be any of:
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagekind)
---
---@return PackageKind
function Package:kind() end

---
---Wether the package is of kind binary
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_binary)
---
---@return boolean
function Package:is_binary() end

---
---Wether the package is of kind toolchain
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_toolchain)
---
---@return boolean
function Package:is_toolchain() end

---
---Wether the package is of kind library
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_library)
---
---@return boolean
function Package:is_library() end

---
---Wether the package is directly required by the user (e.g. xmake.lua)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_toplevel)
---
---@return boolean
function Package:is_toplevel() end

---
---Wether the package is provided by a thirdparty package manager (e.g. brew, conan, vcpkg)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_thirdparty)
---
---@return boolean
function Package:is_thirdparty() end

---
---Wether the package is build with debug mode (Same as `package:config("debug")`)
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_debug)
---
---@return boolean
function Package:is_debug() end

---
---Wether the package is supported by the current platform and architecture
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_supported)
---
---@return boolean
function Package:is_supported() end

---
---Wether the package is getting cross-compiled
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageis_cross)
---
---@return boolean
function Package:is_cross() end

---
---Get the cache directory of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecachedir)
---
---@return string
function Package:cachedir() end

---
---Get the installation directory of the package. Can also be used to get a subdirectory. If the given directory tree does not exist it will be created.
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageinstalldir)
---
---@param ... string
---@return string
function Package:installdir(...) end

---
---Get the directory where the xmake.lua of the package lies
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagescriptdir)
---
---@return string
function Package:scriptdir() end

---
---Get the exported environment variables of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageenvs)
---
---@return { [string]: string[] }
function Package:envs() end

---
---Get the given environment variable
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagegetenv)
---
---@param name string
---@return string[]
function Package:getenv(name) end

---
---Set the given environment variable. Overwrites the variable
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagesetenv)
---
---@param name string
---@param value string
---@param ... string
---@return nil
function Package:setenv(name, value, ...) end

---
---Add the given values to the environment variable
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageaddenv)
---
---@param name string
---@param value string
---@param ... string
---@return nil
function Package:addenv(name, value, ...) end

---
---Get all version strings of the package. Returns a table containing all versions as strings
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageversions)
---
---@return string[]
function Package:versions() end

---
---Get the version of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageversion)
---
---@return Version
function Package:version() end

---
---Get the version of the package as string
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageversion_str)
---
---@return string
function Package:version_str() end

---
---Get the given configuration value of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageconfig)
---
---@param key string
---@return string
function Package:config(key) end

---
---Set the given configuration value of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageconfig_set)
---
---@param key string
---@param value string
---@return nil
function Package:config_set(key, value) end

---
---Get all configurations of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packageconfigs)
---
---@return PackageConfig
function Package:configs() end

---
---Get the build hash of the package
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagebuildhash)
---
---@return string
function Package:buildhash() end

---
---Get all patches of the current version
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagepatches)
---
---@return PackagePatch[]
function Package:patches() end

---
---Wether the package has the given C functions
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_cfuncs(name, opts) end

---
---Wether the package has the given C functions
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cfuncs(name, ...) end

---
---Wether the package has the given C++ functions
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxfuncs)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_cxxfuncs(name, opts) end

---
---Wether the package has the given C++ functions
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxfuncs)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cxxfuncs(name, ...) end

---
---Wether the package has the given C types
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_ctypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_ctypes(name, opts) end

---
---Wether the package has the given C types
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_ctypes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_ctypes(name, ...) end

---
---Wether the package has the given C++ types
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxtypes)
---
---@param name string
---@param opts? HasCheckOpts
---@return boolean
function Package:has_cxxtypes(name, opts) end

---
---Wether the package has the given C++ types
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxtypes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cxxtypes(name, ...) end

---
---Wether the package has the given C header files
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cincludes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cincludes(name, ...) end

---
---Wether the package has the given C++ header files
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagehas_cxxincludes)
---
---@param name string
---@param ... string
---@return boolean
function Package:has_cxxincludes(name, ...) end

---
---Wether the given C snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecheck_csnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Package:check_csnippets(snippet, ...) end

---
---Wether the given C++ snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecheck_cxxsnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Package:check_cxxsnippets(snippet, ...) end

---
---Wether the given Fortran snippet can be compiled and linked
---
---[Open in browser](https://xmake.io/#/manual/package_instance?id=packagecheck_fcsnippets)
---
---@param snippet PackageCheckSnippet
---@param ... PackageCheckSnippet|HasCheckOpts
---@return boolean
function Package:check_fcsnippets(snippet, ...) end
