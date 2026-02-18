--[[
Name: Mason
Language: N/A
Description: Installer for various LSPs, linters, formatters, etc.
Notes:
  - Paired with Mason Tool Installer
--]]
return {
	"mason-org/mason.nvim",
	cmd = "Mason",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
