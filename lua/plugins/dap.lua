--[[
Name: DAP
Language: N/A
Description: Debug Adapter Protocol framework
Notes:
  - Paired with Mason Nvim DAP and Nvim DAP Python
  - Nvim DAP Python also configured in this file
--]]
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		-- "igorlfs/nvim-dap-view",
	},
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
		{
			"<leader>de",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.expression)
			end,
			desc = "View expression",
		},
		{
			"<leader>dh",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.hover()
			end,
			desc = "View debug hover",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Start/Continue Debugger",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Running Debug: Step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Running Debug: Step into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Running Debug: Step out",
		},
		{
			"<Leader>dl",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			desc = "Set logging breakpoint (in REPL)",
		},
		{
			"<Leader>dr",
			function()
				require("dap").run_last()
			end,
			desc = "Run last",
		},
		{
			"<Leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			desc = "View Frames",
		},
		{
			"<Leader>dp",
			function()
				require("dap.ui.widgets").preview()
			end,
			mode = { "n", "v" },
			desc = "View Preview",
		},
	},
	config = function()
		local dap, dv = require("dap"), require("dap-view")
		dap.listeners.before.attach["dap-view-config"] = function()
			dv.open()
		end
		dap.listeners.before.launch["dap-view-config"] = function()
			dv.open()
		end
		dap.listeners.before.event_terminated["dap-view-config"] = function()
			dv.close(true)
		end
		dap.listeners.before.event_exited["dap-view-config"] = function()
			dv.close(true)
		end

		-- Fixes jumping issue detailed here https://github.com/igorlfs/nvim-dap-view?tab=readme-ov-file#jumping
		require("dap").defaults.fallback.switchbuf = "useopen" -- See :h dap-defaults to learn more

		-- nvim-dap-python setup
		-- uses the debugypy installation by mason
		local debugpy_python_path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python3"
		require("dap-python").setup(debugpy_python_path, {}) ---@diagnostic disable-line: missing-fields

		-- Define different icons for DAP stuff
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
	end,
}
