---@meta
---[option_instance](https://xmake.io/#/manual/option_instance)

---@class Option
local Option = {}

---
---Get the value of the option
---
---[Open in browser](https://xmake.io/#/manual/option_instance?id=optionvalue)
---
---@return string
function Option:value() end

---
---Get the name of the option
---
---[Open in browser](https://xmake.io/#/manual/option_instance?id=optionname)
---
---@return string
function Option:name() end

---
---Get the values of the option by name
---
---[Open in browser](https://xmake.io/#/manual/option_instance?id=optionget)
---
---@param key string
---@return string
function Option:get(key) end

---
---Set the values of the option by name (If you just want to add values use [option:add](#optionadd))
---
---[Open in browser](https://xmake.io/#/manual/option_instance?id=optionset)
---
---@param key string
---@param value string
---@return nil
function Option:set(key, value) end

---
---Add to the values of the option by name
---
---[Open in browser](https://xmake.io/#/manual/option_instance?id=optionadd)
---
---@param key string
---@param value string
---@return nil
function Option:add(key, value) end
