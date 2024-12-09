---@meta
---[plugin_task](https://xmake.io/#/manual/plugin_task)

---
---Defining plugins or tasks
---
---[Open in browser](https://xmake.io/#/manual/plugin_task?id=task)
---
---@param name string
---@param scope? ScopeSyntax Scope syntax
---@return nil
function task(name, scope) end

---
---End defining plugins or tasks
---
---[Open in browser](https://xmake.io/#/manual/plugin_task?id=task_end)
---
---@return nil
function task_end() end

---
---**Scoped: task**
---
---Setting the task menu
---
---[Open in browser](https://xmake.io/#/manual/plugin_task?id=taskset_menu)
---
---@param menu TaskMenu
---@return nil
function set_menu(menu) end

---
---**Scoped: task**
---
---Setting task categories
---
---[Open in browser](https://xmake.io/#/manual/plugin_task?id=taskset_category)
---
---@param name string|"plugin"|"action"
---@return nil
function set_category(name) end

---
---**Scoped: task**
---
---Setting up a task to run a script
---
---[Open in browser](https://xmake.io/#/manual/plugin_task?id=taskon_run)
---
---@param func fun(): nil
---@return nil
function on_run(func) end
