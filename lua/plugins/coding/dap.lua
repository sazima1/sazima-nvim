return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dd",
			function()
				require("dap").continue()
			end,
			desc = "Start/Continue Debugger",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Add Breakpoint",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate Debugger",
		},
	},
}
