--[[
Name: Mason Nvim DAP
Language: N/A
Description: Install debug adapters with Mason
--]]
return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
	cmd = { "DapInstall", "DapUninstall" },
	opts = {
		ensure_installed = {
			"python",
			"bash",
		},
	},
}
