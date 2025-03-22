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
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/nvim-nio",
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
				local sidebar = widgets.sidebar(widgets.expression)
				sidebar.open()
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
			"<leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			desc = "View scopes",
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle Debugger UI",
		},
	},
	config = function()
		-- nvim-dap-ui setup
		local listener = require("dap").listeners
		listener.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		end
		listener.before.event_terminated["dapui_config"] = function()
			require("dapui").close()
		end
		listener.before.event_exited["dapui_config"] = function()
			require("dapui").close()
		end

		-- nvim-dap-python setup
		-- fix: E5108: Error executing lua .../Local/nvim-data/lazy/nvim-dap-ui/lua/dapui/controls.lua:14: attempt to index local 'element' (a nil value)
		-- see: https://github.com/rcarriga/nvim-dap-ui/issues/279#issuecomment-1596258077
		local dapui = require("dapui")
		dapui.setup()
		-- uses the debugypy installation by mason
		local debugpy_python_path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python3"
		require("dap-python").setup(debugpy_python_path, {}) ---@diagnostic disable-line: missing-fields

		-- Define different icons for DAP stuff
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
	end,
}
