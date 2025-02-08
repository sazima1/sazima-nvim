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
