---@meta
---[option_instance](https://xmake.io/#/zh-cn/manual/option_instance)

---@class Option
local Option = {}

---
---获取选项的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/option_instance?id=optionvalue)
---
---@return string
function Option:value() end

---
---获取选项的名字
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/option_instance?id=optionname)
---
---@return string
function Option:name() end

---
---获取选项在描述域的配置值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/option_instance?id=optionget)
---
---@param key string
---@return string
function Option:get(key) end

---
---设置选项的配置值，（如果你想添加值可以用 Option:add()）。
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/option_instance?id=optionset)
---
---@param key string
---@param value string
---@return nil
function Option:set(key, value) end

---
---按名称添加到选项的值
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/option_instance?id=optionadd)
---
---@param key string
---@param value string
---@return nil
function Option:add(key, value) end
