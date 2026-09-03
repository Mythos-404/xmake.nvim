---@class xmake.Runners
local M = {}

local Utils = require("xmake.utils")
local Config = require("xmake.config")

---@param str string
local function clean_ASCI_color(str)
    if not str then return "" end
    return str:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
end

---@param opts vim.SystemOpts|nil
---@return vim.SystemOpts
local function normalize_opts(opts)
    opts = opts or {}
    opts.env = opts.env or {}
    return opts
end

---@class xmake.Runner
---@field run fun(self: self, cmd: string[], opts: vim.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(): nil

---@class xmake.SystemOpts: vim.SystemOpts
---@field args string[]

local runners = {}

---@class xmake.Runner.QuickFix: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.quickfix = {
    ---@type xmake.Config.QuickFix
    config = nil,

    _append_to_quickfix = function(self, data)
        local lines = vim.iter(vim.split(data, "\n"))
            :filter(function(lien)
                return #lien ~= 0
            end)
            :totable()

        vim.fn.setqflist({}, "a", { lines = lines })
        if self:_check_scroll() then vim.api.nvim_command("cbottom") end
    end,

    _check_scroll = function()
        if vim.bo.buftype == "quickfix" then
            local current_buf = vim.api.nvim_win_get_buf(0)
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            local line_count = vim.api.nvim_buf_line_count(current_buf)
            return cursor_pos[1] == line_count - 1
        end
        return true
    end,

    _handle_output = function(self, output_type, opts)
        return vim.schedule_wrap(function(err, data)
            err = clean_ASCI_color(err)
            data = clean_ASCI_color(data)
            if opts[output_type] then opts[output_type](err, data) end
            self:_append_to_quickfix(data)
        end)
    end,

    run = function(self, cmd, opts, on_exit)
        opts = normalize_opts(opts)
        local _opts = vim.tbl_deep_extend("force", {
            stdout = self:_handle_output("stdout", opts),
            stderr = self:_handle_output("stderr", opts),
            text = true,
        }, opts)

        local _on_exit = vim.schedule_wrap(function(out)
            if on_exit then on_exit(out.code) end

            if out.code == 0 then
                if self.config.close_on_success then self:close() end
                return
            end
            if out.code ~= 0 then
                if self.config.show ~= "only_on_error" then return end
                self:show()
                vim.api.nvim_command("cbottom")
            end
        end)

        vim.fn.setqflist({}, " ", { title = table.concat(cmd, " ") })

        if self.config.show == "always" then self:show() end

        vim.system(cmd, _opts, _on_exit)
    end,

    show = function(self)
        vim.api.nvim_command(self.config.position .. " copen " .. self.config.size)
        vim.api.nvim_command("wincmd p")
    end,

    close = function()
        vim.api.nvim_command("cclose")
    end,
}

---@class xmake.Runner.Toggleterm: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.toggleterm = {
    ---@type xmake.Config.Toggleterm
    config = nil,

    state = {
        ---@type any
        ins_term = nil,
    },

    run = function(self, cmd, opts, on_exit)
        opts = normalize_opts(opts)
        local has_tg, tg = pcall(require, "toggleterm.terminal")
        if not has_tg then
            Utils.error("toggleterm.nvim is not installed, but runner/execute type is 'toggleterm'")
            if on_exit then on_exit(1) end
            return
        end

        if self.config.singleton and self.state.ins_term then self.state.ins_term:close() end
        self.state.ins_term = tg.Terminal:new({
            cmd = table.concat(cmd, " "),
            dir = opts.cwd,
            env = not vim.tbl_isempty(opts.env) and opts.env or nil,
            direction = self.config.direction,
            auto_scroll = self.config.auto_scroll,
            close_on_exit = false,
            on_stdout = function(_, _, data, _)
                if opts.stdout then opts.stdout(nil, data) end
            end,
            on_stderr = function(_, _, data, _)
                if opts.stderr then opts.stderr(nil, data) end
            end,
            on_exit = function(_, _, exit_code, _)
                if on_exit then on_exit(exit_code) end

                if exit_code == 0 then
                    if self.config.close_on_success then self:close() end
                end
            end,
        })
        self.state.ins_term:toggle()
    end,
    show = function(self)
        self.state.ins_term:open()
    end,
    close = function(self)
        self.state.ins_term:close()
    end,
}

---@class xmake.Runner.Snacks: xmake.Runner
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.snacks = {
    ---@type xmake.Config.Snacks
    config = nil,

    state = {
        ---@type any
        term = nil,
    },

    run = function(self, cmd, opts, on_exit)
        opts = normalize_opts(opts)
        if Snacks == nil then
            Utils.error("snacks.nvim is not installed, but runner/execute type is 'snacks'")
            if on_exit then on_exit(1) end
            return
        end

        local env = {}
        for key, value in pairs(opts.env) do
            if type(value) == "number" then
                env[key] = tostring(value)
            elseif type(value) == "string" then
                env[key] = value
            end
        end

        local term_opts = {
            win = {
                position = self.config.position,
            },
            cwd = opts.cwd,
            auto_close = self.config.auto_close,
            start_insert = self.config.start_insert,
            auto_insert = self.config.auto_insert,
            interactive = self.config.interactive,
        }
        if not vim.tbl_isempty(env) then term_opts.env = env end

        self.state.term = Snacks.terminal(cmd, term_opts)
        self.state.term:on("TermClose", function()
            if on_exit and type(vim.v.event) == "table" then on_exit(vim.v.event.status) end
        end)
    end,
    show = function(self)
        self.state.term:show()
    end,
    close = function(self)
        self.state.term:close()
    end,
}

---@class xmake.Runner.Terminal
---@field run fun(self: self, cmd: string[], opts: xmake.SystemOpts, on_exit?: fun(code: number))
---@field show fun(self: self): nil
---@field close fun(self: self): nil
runners.terminal = {
    ---@type xmake.Config.Terminal
    config = nil,

    state = {
        ---@type integer|nil
        buf = nil,
        ---@type integer|nil
        chan = nil,
    },

    _term_name = function(self)
        return self.config.prefix_name .. self.config.name
    end,

    _ensure_buf = function(self)
        local term_name = self:_term_name()
        if self.state.buf and vim.api.nvim_buf_is_valid(self.state.buf) and self.state.chan then
            return self.state.buf
        end

        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
            if buf_name == term_name and vim.api.nvim_buf_is_valid(bufnr) then
                local ok, chan = pcall(vim.api.nvim_buf_get_var, bufnr, "terminal_job_id")
                if ok and chan then
                    self.state.buf = bufnr
                    self.state.chan = chan
                    return bufnr
                end
                vim.api.nvim_buf_delete(bufnr, { force = true })
                break
            end
        end

        local buf = vim.api.nvim_create_buf(false, true)
        pcall(vim.api.nvim_buf_set_name, buf, term_name)
        vim.bo[buf].filetype = "xmake_terminal"
        vim.bo[buf].bufhidden = "hide"
        self.state.chan = vim.api.nvim_open_term(buf, {})
        self.state.buf = buf
        return buf
    end,

    _reposition = function(self)
        local buflist = {}
        for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
                local buf = vim.api.nvim_win_get_buf(win)
                local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")

                if bufname:sub(1, #self.config.prefix_name) == self.config.prefix_name then
                    if vim.api.nvim_get_current_tabpage() ~= tabpage then
                        vim.api.nvim_win_close(win, false)
                    else
                        table.insert(buflist, win)
                    end
                end
            end
        end

        if next(buflist) then
            for i = 1, #buflist do
                if i > 1 then vim.api.nvim_win_close(buflist[i], false) end
            end
            return buflist[1] --[[ @as integer ]]
        end

        return -1
    end,

    _ensure_win = function(self)
        local buf = self:_ensure_buf()
        local win_id = self:_reposition()
        if win_id ~= -1 then
            vim.api.nvim_win_set_buf(win_id, buf)
            if self.config.auto_resize then
                if self.config.split_direction == "horizontal" then
                    vim.api.nvim_win_set_height(win_id, self.config.split_size)
                else
                    vim.api.nvim_win_set_width(win_id, self.config.split_size)
                end
            end
        else
            vim.cmd(":" .. self.config.split_direction .. " " .. self.config.split_size .. "sp")
            win_id = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_buf(win_id, buf)
        end

        if self.config.focus then
            vim.api.nvim_set_current_win(win_id)
            if self.config.focus_auto_insert then vim.cmd("startinsert") end
        elseif vim.api.nvim_get_current_win() == win_id then
            vim.cmd("wincmd p")
        end
        return win_id
    end,

    _write = function(self, data)
        if not data or data == "" or not self.state.chan then return end
        pcall(vim.api.nvim_chan_send, self.state.chan, data:gsub("\r?\n", "\r\n"))
    end,

    run = function(self, cmd, opts, on_exit)
        opts = normalize_opts(opts)
        self:_ensure_win()
        self:_write(table.concat(cmd, " ") .. "\r\n")

        local sys_opts = {
            cwd = opts.cwd,
            text = true,
            stdout = vim.schedule_wrap(function(_, data)
                self:_write(data)
                if opts.stdout then opts.stdout(nil, data) end
            end),
            stderr = vim.schedule_wrap(function(_, data)
                self:_write(data)
                if opts.stderr then opts.stderr(nil, data) end
            end),
        }
        if not vim.tbl_isempty(opts.env) then
            local env = vim.fn.environ()
            for key, value in pairs(opts.env) do
                env[key] = tostring(value)
            end
            sys_opts.env = env
        end

        vim.system(
            cmd,
            sys_opts,
            vim.schedule_wrap(function(out)
                self:_write(("\r\n[exit %s]\r\n"):format(tostring(out.code)))
                if on_exit then on_exit(out.code) end
                if out.code == 0 and self.config.close_on_success then self:close() end
            end)
        )
    end,

    show = function(self)
        if not self.state.buf or not vim.api.nvim_buf_is_valid(self.state.buf) then
            Utils.info("There is no terminal instance")
            return
        end
        self:_ensure_win()
    end,

    close = function(self)
        if not self.state.buf then
            Utils.info("There is no terminal instance")
            return
        end

        local win_id = self:_reposition()
        if win_id ~= -1 then vim.api.nvim_win_close(win_id, false) end
    end,
}

---@param kind "runner"|"execute"
local function create_runner_metatable(kind)
    return setmetatable({}, {
        __call = function(_, cmd, opts, on_exit)
            opts = normalize_opts(opts)
            local name = Config[kind].type
            local runner = runners[name]
            if not runner then
                Utils.error(("Unknown %s type `%s`"):format(kind, tostring(name)))
                if on_exit then on_exit(1) end
                return
            end
            runner.config = Config[kind].config[name]
            return runner.run(runner, cmd, opts, on_exit)
        end,
        __index = function(_, key)
            local name = Config[kind].type
            local runner = runners[name]
            if not runner then return nil end
            runner.config = Config[kind].config[name]
            return runner[key]
        end,
    })
end

---@class xmake.Runners.Runner: xmake.Runner
---@overload fun(cmd: string[], opts: vim.SystemOpts, on_exit?: fun(code: number))
M.run = create_runner_metatable("runner")

---@class xmake.Runners.Execute: xmake.Runner
---@overload fun(cmd: string[], opts: vim.SystemOpts, on_exit?: fun(code: number))
M.exe = create_runner_metatable("execute")

return M
