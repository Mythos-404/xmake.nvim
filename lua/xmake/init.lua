local M = {}

M.config = {
	plat = "",
	arch = "",
	mode = "",
	toolchain = "",
	target = "",
	targets = {},
	target_exec_path = "",
	compile_commands_dir = ".vscode",
}
M.default_config = M.config

local function create_menu(top_text, lines, on_submit, size)
	local Menu = require("nui.menu")
	-- local event = require("nui.utils.autocmd").event

	local menu = Menu({
		position = "50%",
		size = size or {
			width = 20,
			height = 15,
		},
		border = {
			style = "single",
			text = {
				top = top_text,
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = lines,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_submit = on_submit,
	})

	return menu
end

local function swich_xmake_config(item)
	local mode = {
		["Toolchain"] = function()
			require("xmake").set_toolchain()
		end,
		["Mode"] = function()
			require("xmake").set_mode()
		end,
		["Target"] = function()
			require("xmake").set_target()
		end,
		["Plat"] = function()
			require("xmake").set_plat()
		end,
		["Arch"] = function()
			require("xmake").set_arch()
		end,
	}

	local mode_func = mode[item.text]
	if mode_func then
		mode_func()
	end
end

local function async_exec_commnd(cmd, message)
	local util = require("xmake.util")
	vim.fn.jobstart(cmd, {
		on_stdout = function(_, _, _) end,
		on_stderr = function(_, data, _)
			for i, v in ipairs(data) do
				if string.len(v) ~= 0 then
					util.error(string.format("error:%s,%s", i, v))
				end
			end
		end,
		on_exit = function(_, exit_code, _)
			if exit_code ~= 0 then
				util.error(string.format("error_code:%s", exit_code))
				return
			else
				util.info(message)
			end
		end,
	})
end

--- @param command string
--- @return string
local function get_xmake_output(command)
	local handle = io.popen(command)
	if handle == nil then
		return ""
	end
	local output = string.gsub(handle:read("*a"), "\27%[.-m", "")
	handle:close()
	return output
end

local function create_menu_item(cmd, match)
	local Menu = require("nui.menu")
	local menus = {}
	for i in (get_xmake_output(cmd)):gmatch(match or "[^\n]+") do
		table.insert(menus, Menu.item("" .. i))
	end
	return menus
end

local function get_target_exec_path()
	M.config.target_exec_path =
		string.match(get_xmake_output("xmake show -t" .. M.config.target), "targetfile:%s*(.-)\n")
end

function M.get_project_info()
	local output = get_xmake_output("xmake show")
	if output == nil then
		return
	end

	for i in (get_xmake_output([[xmake show -l targets | sed 's/\x1b\[[0-9;]*m//g']])):gmatch("") do
		table.insert(M.config.targets, i)
	end

	M.config.plat = string.match(output, "plat:%s*(.-)\n")
	M.config.arch = string.match(output, "arch:%s*(.-)\n")
	M.config.mode = string.match(output, "mode:%s*(.-)\n")
	M.config.target = M.config.targets[1]
	get_target_exec_path()
end

function M.set_toolchain()
	local menu = create_menu("Set Toolchain", create_menu_item("xmake show --list=toolchains"), function(item)
		M.config.toolchain = item.text
		async_exec_commnd("xmake config --toolchain=" .. M.config.toolchain:match("%S+"), "Swich Toolchain Ok!")
	end, {
		width = 100,
		height = 15,
	})

	menu:mount()
end

function M.set_mode()
	local Menu = require("nui.menu")
	local menu = create_menu("Set Build Mode", {
		Menu.item("debug"),
		Menu.item("release"),
		Menu.item("releasedeg"),
		Menu.item("minsizerel"),
		Menu.item("check"),
		Menu.item("profile"),
		Menu.item("coverage"),
		Menu.item("valgrind"),
		Menu.item("asan"),
		Menu.item("tsan"),
		Menu.item("lsan"),
		Menu.item("ubsan"),
	}, function(item)
		M.config.mode = item.text
		async_exec_commnd("xmake config --mode=" .. M.config.mode, "Swich Build Mode Ok!")
	end)

	menu:mount()
end

function M.set_target()
	local menu = create_menu(
		"Set Target",
		create_menu_item([[xmake show -l targets | sed 's/\x1b\[[0-9;]*m//g']], "%S+"),
		function(item)
			M.config.target = item.text
		end,
		{
			width = 50,
			height = 15,
		}
	)

	menu:mount()

	get_target_exec_path()
end

function M.set_plat()
	local Menu = require("nui.menu")
	local menu = create_menu("Set Plat", {
		Menu.item("windows"),
		Menu.item("linux"),
		Menu.item("macosx"),
		Menu.item("android"),
		Menu.item("iphoneos"),
		Menu.item("watchos"),
		Menu.item("mingw"),
		Menu.item("cygwin"),
		Menu.item("bsd"),
		Menu.item("msys"),
		Menu.item("wasm"),
		Menu.item("appletvos"),
		Menu.item("cross"),
		Menu.item("haiku"),
	}, function(item)
		M.config.plat = item.text
		async_exec_commnd("xmake config --plat=" .. M.config.plat, "Swich Plat Ok!")
	end)

	menu:mount()
end

function M.set_arch()
	local Menu = require("nui.menu")

	local arch_item = {
		["windows"] = function()
			return {
				Menu.item("x86"),
				Menu.item("x64"),
				Menu.item("arm64"),
			}
		end,
		["linux"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
				Menu.item("armv7"),
				Menu.item("armv7s"),
				Menu.item("arm64-v8a"),
				Menu.item("mips"),
				Menu.item("mips64"),
				Menu.item("mipsel"),
				Menu.item("mips64el"),
				Menu.item("loongarch64"),
			}
		end,
		["macosx"] = function()
			return {
				Menu.item("x86_64"),
				Menu.item("arm64"),
			}
		end,
		["android"] = function()
			return {
				Menu.item("armeabi"),
				Menu.item("armeabi-v7a"),
				Menu.item("arm64-v8a"),
				Menu.item("x86"),
				Menu.item("x86_64"),
				Menu.item("mips"),
				Menu.item("mip64"),
				Menu.item("Mi"),
			}
		end,
		["iphoneos"] = function()
			return {
				Menu.item("x86_64"),
				Menu.item("arm64"),
			}
		end,
		["watchos"] = function()
			return {
				Menu.item("armv7k"),
				Menu.item("i386"),
			}
		end,
		["mingw"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
				Menu.item("arm"),
				Menu.item("arm64"),
			}
		end,
		["cygwin"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
			}
		end,
		["bsd"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
			}
		end,
		["msys"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
			}
		end,
		["wasm"] = function()
			return {
				Menu.item("wasm32"),
			}
		end,
		["appletvos"] = function()
			return {
				Menu.item("arm64"),
				Menu.item("armv7s"),
				Menu.item("i386"),
				Menu.item("x86_64"),
			}
		end,
		["cross"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
				Menu.item("arm"),
				Menu.item("arm64"),
				Menu.item("mips"),
				Menu.item("mips64"),
				Menu.item("riscv"),
				Menu.item("riscv64"),
				Menu.item("ppc"),
				Menu.item("ppc64"),
				Menu.item("s390x"),
				Menu.item("sh4"),
			}
		end,
		["haiku"] = function()
			return {
				Menu.item("i386"),
				Menu.item("x86_64"),
			}
		end,
	}

	local user_conf_plat = M.config.plat
	local menu = create_menu("Set Arch(" .. user_conf_plat .. ")", arch_item[user_conf_plat](), function(item)
		M.config.arch = item.text
		async_exec_commnd("xmake config --arch=" .. M.config.arch, "Swich Architectures Ok!")
	end)

	menu:mount()
end

function M.setting()
	local Menu = require("nui.menu")

	local menu = create_menu("Xmake Setting", {
		Menu.item("Toolchain"),
		Menu.item("Mode"),
		Menu.item("Target"),
		Menu.item("Plat"),
		Menu.item("Arch"),
	}, swich_xmake_config)

	menu:mount()
end

function M.update_intellisense()
	if vim.fn.expand("%:t") == "xmake.lua" then
		async_exec_commnd(
			"xmake project -k compile_commands --lsp=clangd " .. M.config.compile_commands_dir,
			"Update Intellisense Ok!"
		)
	end
end

local function create_menu_callback(cb)
	local menu = create_menu(
		"Option Target",
		create_menu_item([[xmake show -l targets | sed 's/\x1b\[[0-9;]*m//g']], "%S+"),
		function(item)
			M.config.target = item.text
			cb(M.config.target)
		end,
		{
			width = 50,
			height = 15,
		}
	)

	menu:mount()
end

function M.build()
	async_exec_commnd("xmake -w " .. M.config.target, "Build " .. M.config.target .. " Successfully!")
end
function M.build_all()
	async_exec_commnd("xmake -w", "Build All Successfully!")
end
function M.build_target()
	create_menu_callback(function(target)
		async_exec_commnd("xmake -w " .. target, "Build " .. target .. " Successfully!")
	end)
end

function M.clean()
	async_exec_commnd("xmake clean " .. M.config.target, "Clean " .. M.config.target .. " Successfully!")
end
function M.clean_all()
	async_exec_commnd("xmake clean --all", "Clean All Successfully!")
end
function M.clean_target()
	create_menu_callback(function(target)
		async_exec_commnd("xmake clean " .. target, "Clean " .. target .. " Successfully!")
	end)
end

function M.setup(user_conf)
	user_conf = user_conf or {}
	M.config = vim.tbl_deep_extend("keep", user_conf, M.default_config)

	local cmd = vim.api.nvim_create_user_command
	if not cmd then
		return
	end
	M.get_project_info()

	vim.api.nvim_command("autocmd BufWritePost * lua require('xmake').update_intellisense()")

	cmd("XmakeSetMenu", function()
		require("xmake").setting()
	end, { nargs = 0 })
	cmd("XmakeSetToolchain", function()
		require("xmake").set_toolchain()
	end, { nargs = 0 })
	cmd("XmakeSetMode", function()
		require("xmake").set_mode()
	end, { nargs = 0 })
	cmd("XmakeSetTarget", function()
		require("xmake").set_target()
	end, { nargs = 0 })
	cmd("XmakeSetPlat", function()
		require("xmake").set_plat()
	end, { nargs = 0 })
	cmd("XmakeSetArch", function()
		require("xmake").set_arch()
	end, { nargs = 0 })

	cmd("XmakeBuild", function()
		require("xmake").build()
	end, { nargs = 0 })
	cmd("XmakeBuildAll", function()
		require("xmake").build_all()
	end, { nargs = 0 })
	cmd("XmakeBuildTarget", function()
		require("xmake").build_target()
	end, { nargs = 0 })
	cmd("XmakeClean", function()
		require("xmake").clean()
	end, { nargs = 0 })
	cmd("XmakeCleanAll", function()
		require("xmake").clean_all()
	end, { nargs = 0 })
	cmd("XmakeCleanTarget", function()
		require("xmake").clean_target()
	end, { nargs = 0 })
end

return M
