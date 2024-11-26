---@meta
---[plugin_task](https://xmake.io/#/zh-cn/manual/plugin_task)

---
---定义插件或者任务
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/plugin_task?id=task)
---
---@param name string
---@param scope? ScopeSyntax 范围语法
---@return nil
function task(name, scope) end

---
---结束定义插件或任务
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/plugin_task?id=task_end)
---
---@return nil
function task_end() end

---
---**范围: task**
---
---设置任务菜单
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/plugin_task?id=taskset_menu)
---
---@param menu TaskMenu
---@return nil
function set_menu(menu) end

---
---**范围: task**
---
---设置任务类别
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/plugin_task?id=taskset_category)
---
---@param name string|"plugin"|"action"
---@return nil
function set_category(name) end

---
---**范围: task**
---
---设置任务运行脚本
---
---[在浏览器中打开](https://xmake.io/#/zh-cn/manual/plugin_task?id=taskon_run)
---
---@param func fun(): nil
---@return nil
function on_run(func) end
