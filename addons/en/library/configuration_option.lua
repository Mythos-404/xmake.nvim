---@meta
---[configuration_option](https://xmake.io/#/manual/configuration_option)

---
---Defining options
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=option)
---
---@param name string
---@param scope? ScopeSyntax Scop syntax
---@return nil
function option(name, scope) end

---
---End definition option
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=option_end)
---
---@return nil
function option_end() end

---
---**Scoped: option**
---
---Adding options depends
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_deps)
---
---@param option string
---@param ... string
---@return nil
function add_deps(option, ...) end

---
---**Scoped: option**
---
---Custom Option Detection Script
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionon_check)
---
---@param func fun(option: Option): nil
---@return nil
function on_check(func) end

---
---**Scoped: option**
---
---Setting the list of option values
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionset_values)
---
---@param value string
---@param ... string
---@return nil
function set_values(value, ...) end

---
---**Scoped: option**
---
---Setting options defaults
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionset_default)
---
---@param default string|boolean
---@return nil
function set_default(default) end

---
---**Scoped: option**
---
---Set whether to enable menu display
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionset_showmenu)
---
---@param enabled boolean
---@return nil
function set_showmenu(enabled) end

---
---**Scoped: option**
---
---Setting option categories, only for menu display
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionset_category)
---
---@param name string Group name
---@return nil
function set_category(name) end

---
---**Scoped: option**
---
---Setting menu display description
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionset_description)
---
---@param description string
---@param ... string
---@return nil
function set_description(description, ...) end

---
---**Scoped: option**
---
---Add Link Library Detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_links)
---
---@param link string
---@param ... string
---@return nil
function add_links(link, ...) end

---
---**Scoped: option**
---
---Adding the search directory needed for link library detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_linkdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_linkdirs(dir, ...) end

---
---**Scoped: option**
---
---Adding a load search directory for a dynamic library at runtime
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_rpathdirs)
---
---@param dir string
---@param ... string
---@return nil
function add_rpathdirs(dir, ...) end

---
---**Scoped: option**
---
---Add c header file detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_cincludes)
---
---@param name string
---@param ... string
---@return nil
function add_cincludes(name, ...) end

---
---**Scoped: option**
---
---Add c++ header file detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_cxxincludes)
---
---@param name string
---@param ... string
---@return nil
function add_cxxincludes(name, ...) end

---
---**Scoped: option**
---
---Add c type detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_ctypes)
---
---@param type string
---@param ... string
---@return nil
function add_ctypes(type, ...) end

---
---**Scoped: option**
---
---Adding c++ type detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_cxxtypes)
---
---@param type string
---@param ... string
---@return nil
function add_cxxtypes(type, ...) end

---
---**Scoped: option**
---
---Add c code fragment detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_csnippets)
---
---@param name string
---@param snippet string
---@param opts? {tryrun: boolean, output: boolean}|table
---@return nil
function add_csnippets(name, snippet, opts) end

---
---**Scoped: option**
---
---Adding c++ code snippet detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_cxxsnippets)
---
---@param name string
---@param snippet string
---@param opts? {tryrun: boolean, output: boolean}|table
---@return nil
function add_cxxsnippets(name, snippet, opts) end

---
---**Scoped: option**
---
---Add c library function detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_cfuncs)
---
---@param code string
---@param ... string
---@return nil
function add_cfuncs(code, ...) end

---
---**Scoped: option**
---
---Add c++ library function detection
---
---[Open in browser](https://xmake.io/#/manual/configuration_option?id=optionadd_cxxfuncs)
---
---@param code string
---@param ... string
---@return nil
function add_cxxfuncs(code, ...) end
