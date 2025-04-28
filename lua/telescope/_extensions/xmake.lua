local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

---@param name string?
---@return string[]
local function get_xmake_files(name)
    local output = vim.system({
        "xmake",
        "lua",
        "--command",
        [[
                import("core.project.config").load()
                local sourcefiles = {}
                local scriptfiles = os.files("*/**/xmake.lua")
                table.insert(scriptfiles, "xmake.lua")
                for _, target in pairs(import("core.project.project").targets()) do
                    table.join2(sourcefiles, target:sourcefiles()[1])
                end
                print(
                    import("core.base.json").encode({
                        sourcefiles = table.unique(sourcefiles),
                        scriptfiles = table.unique(scriptfiles),
                    })
                )
            ]], --> INJECT: lua
    }):wait()

    if output.code ~= 0 or not output.stdout or #output.stdout == 0 then
        local error_msg = (
            (output.code ~= 0) and ("Command execution failed with code " .. output.code)
            or "Command executed successfully but returned no output."
        ) .. "\nPlease check that your `xmake.lua` configuration is correct."
        require("xmake.utils").error(error_msg)
        return {}
    end

    local result = vim.json.decode(output.stdout)
    if not name then return vim.iter(vim.tbl_values(result)):flatten():totable() end
    return result[name]
end

---@param title string
---@param name string?
---@return fun(opts: table): nil
local function create_picker(title, name)
    return function(opts)
        opts = opts or {}
        opts.cwd = opts.cwd or vim.uv.cwd()

        pickers
            .new(opts, {
                prompt_title = title,
                finder = finders.new_table({
                    results = get_xmake_files(name),
                    entry_maker = make_entry.gen_from_file(opts),
                }),
                sorter = conf.file_sorter(opts),
                previewer = conf.file_previewer(opts),
            })
            :find()
    end
end

return require("telescope").register_extension({
    exports = {
        all = create_picker("Xmake - All Files"),
        sources = create_picker("Xmake - Source Files", "sourcefiles"),
        scripts = create_picker("Xmake - Script Files", "scriptfiles"),
    },
})
