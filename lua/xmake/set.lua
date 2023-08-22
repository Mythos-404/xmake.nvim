local M = {}

local config = require("xmake").config
local util = require("xmake.util")
local async_exec_commnd = util.async_exec_commnd
local async_commnd_callback = util.async_commnd_callback

function M.create_menu(top_text, lines, on_submit, size)
	local Menu = require("nui.menu")

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
			require("xmake.set").set_toolchain()
		end,
		["Mode"] = function()
			require("xmake.set").set_mode()
		end,
		["Target"] = function()
			require("xmake.set").set_target()
		end,
		["Plat"] = function()
			require("xmake.set").set_plat()
		end,
		["Arch"] = function()
			require("xmake.set").set_arch()
		end,
	}

	mode[item.text]()
end

function M.get_target_exec_path()
	async_commnd_callback("xmake show -t" .. config.target, function(_, data, _)
		for _, str in pairs(data) do
			local path = string.match(str, "targetfile: (.-)\n")
			if path ~= nil then
				config.target_exec_path = path
			end
		end
	end)
end

local function get_toolchanins()
	async_commnd_callback("xmake show -l toolchains", function(_, data, _)
		for _, str in pairs(data) do
			local outstr = string.gsub(str, [[\n^[[0m]], "")
			if outstr ~= nil then
				local toolchain = outstr:match("^(%S+)")
				if toolchain ~= nil then
					table.insert(config.toolchains, toolchain)
				end
			end
		end
	end)
end

local function create_toolchain_menu_items()
	local menu = require("nui.menu")
	local items = {}
	for _, toolchain in pairs(config.toolchains) do
		table.insert(items, menu.item(toolchain))
	end
	return items
end

function M.get_targets()
	async_commnd_callback([[xmake show -l targets]], function(_, data, _)
		for _, str in pairs(data) do
			local outstr = string.gsub(string.gsub(str, [[\x1b\[[0-9;]m]], ""), "\27%[.-m", "")
			if outstr ~= nil then
				for target in outstr:gmatch("%S+") do
					table.insert(config.targets, target)
				end
			end
			config.target = config.target == "" and config.targets[1] or config.target
		end
		M.get_target_exec_path()
	end)
end

function M.create_target_menu_items()
	local Menu = require("nui.menu")
	local items = {}
	for _, target in pairs(config.targets) do
		table.insert(items, Menu.item(target))
	end
	return items
end

function M.set_toolchain()
	local menu = M.create_menu("Set Toolchain", create_toolchain_menu_items(), function(item)
		config.toolchain = item.text
		async_exec_commnd("xmake conig --toolchain=" .. config.toolchain, "Swich Toolchain Ok!")
	end)

	menu:mount()
end

function M.set_mode()
	local Menu = require("nui.menu")
	local menu = M.create_menu("Set Build Mode", {
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
		config.mode = item.text
		async_exec_commnd("xmake config --mode=" .. config.mode, "Swich Build Mode Ok!")
	end)

	menu:mount()
end

function M.set_target()
	local menu = M.create_menu("Set Target", M.create_target_menu_items(), function(item)
		config.target = item.text
		M.get_target_exec_path()
	end, {
		width = 50,
		height = 15,
	})

	menu:mount()
end

function M.set_plat()
	local Menu = require("nui.menu")
	local menu = M.create_menu("Set Plat", {
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
		config.plat = item.text
		async_exec_commnd("xmake config --plat=" .. config.plat, "Swich Plat Ok!")
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

	local user_conf_plat = config.plat
	local menu = M.create_menu("Set Arch(" .. user_conf_plat .. ")", arch_item[user_conf_plat](), function(item)
		config.arch = item.text
		async_exec_commnd("xmake config --arch=" .. config.arch, "Swich Architectures Ok!")
	end)

	menu:mount()
end

function M.setting()
	local Menu = require("nui.menu")

	local menu = M.create_menu("Xmake Setting", {
		Menu.item("Toolchain"),
		Menu.item("Mode"),
		Menu.item("Target"),
		Menu.item("Plat"),
		Menu.item("Arch"),
	}, swich_xmake_config)

	menu:mount()
end

function M.get_project_info()
	async_commnd_callback("xmake show", function(_, data, _)
		for _, str in pairs(data) do
			local outstr = string.gsub(str, "\27%[.-m", "")

			local plat = string.match(outstr, "plat: (.*)$")
			local arch = string.match(outstr, "arch: (.*)$")
			local mode = string.match(outstr, "mode: (.*)$")

			if plat ~= nil then
				config.plat = plat
			end

			if arch ~= nil then
				config.arch = arch
			end

			if mode ~= nil then
				config.mode = mode
			end
		end
		config.mode = config.mode == "" and "debug" or config.mode
		async_commnd_callback("xmake config --mode=" .. config.mode, function(_, _, _) end)
	end)

	get_toolchanins()
	M.get_targets()
end

function M.init()
	local cmd = vim.api.nvim_create_user_command

	M.get_project_info()

	cmd("XmakeSetMenu", function() require("xmake.set").setting() end, { nargs = 0 })
	cmd("XmakeSetToolchain", function() require("xmake.set").set_toolchain() end, { nargs = 0 })
	cmd("XmakeSetMode", function() require("xmake.set").set_mode() end, { nargs = 0 })
	cmd("XmakeSetTarget", function() require("xmake.set").set_target() end, { nargs = 0 })
	cmd("XmakeSetPlat", function() require("xmake.set").set_plat() end, { nargs = 0 })
	cmd("XmakeSetArch", function() require("xmake.set").set_arch() end, { nargs = 0 })
end

return M
