-- ORDER OF LOADING MATTERS

----------- Profile Startup with `PROF=1 nvim` --------------
if vim.env.PROF then
	-- example for lazy.nvim
	-- change this to the correct path for your plugin manager
	local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
	vim.opt.rtp:append(snacks)
	require("snacks.profiler").startup({
		startup = {
			event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
			-- event = "UIEnter",
			-- event = "VeryLazy",
		},
	})
end
-------------------------------------------------------------

------------------- Bootstrap lazy.nvim ---------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
-------------------------------------------------------------

--------------------- Load Config ---------------------------
-- Load keymaps and settings before loading lazy
require("config.set")
require("config.keymaps")

-- Load lazy.nvim (which subsequently loads all plugins in 'lua/plugins' except 'lua/unloaded')
require("config.lazy")

-- Start LSP servers
require("config.lsp")

-- Set colorscheme (plugin sets theme automatically, so it's loaded after all plugins are loaded)
require("config.colorscheme")

-- Load auto commands and user commands after all plugins, sets, keymaps, etc. are loaded
require("config.autocmd")
require("config.usercmd")
-------------------------------------------------------------

--------------------- Other Stuff ---------------------------
-- Check if mason tools have been installed
-- Check if the file exists
local filename = vim.fn.stdpath("data") .. "mason_tools_installed"
local file = io.open(filename, "r")
if file then
	-- File exists, close it
	file:close()
else
	-- File doesn't exist, create it
	file = io.open(filename, "w")
	if file then
		file:close()
		vim.cmd("MasonToolsInstall")
		print("Mason tools have been installed!" .. filename)
	else
		print("Something went wrong...")
	end
end
-------------------------------------------------------------
local parsers = require("nvim-treesitter.parsers")
local install = require("nvim-treesitter.install")

local wanted = { "python", "markdown", "markdown_inline" }

for _, lang in ipairs(wanted) do
	local parser_config = parsers.get_parser_configs()[lang]
	if parser_config and not parsers.has_parser(lang) then
		install.commands.TSInstall(lang)
	end
end
