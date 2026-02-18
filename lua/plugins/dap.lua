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
			function() require("dap").continue() end,
			desc = "Start/Continue debugger",
		},
		{
			"<leader>dr",
			function() require("dap").restart() end,
			desc = "Restart debugger",
		},
		{
			"<leader>dt",
			function() require("dap").terminate() end,
			desc = "Terminate debugger",
		},
		{
			"<leader>di",
			function() require("dap").step_into() end,
			desc = "Running Debug: Step into",
		},
		{
			"<leader>dn",
			function() require("dap").step_over() end,
			desc = "Running Debug: Step over",
		},
		{
			"<leader>do",
			function() require("dap").step_out() end,
			desc = "Running Debug: Step out",
		},
		{
			"<leader>dp",
			function() require("dap").step_back() end,
			desc = "Running Debug: Step back",
		},
		{
			"<F5>",
			function() require("dap").continue() end,
			desc = "Start/Continue Debugger",
		},
		{
			"<F6>",
			function() require("dap").restart() end,
			desc = "Restart Debugger",
		},
		{
			"<F7>",
			function() require("dap").terminate() end,
			desc = "Terminate Debugger",
		},
		{
			"<F10>",
			function() require("dap").step_over() end,
			desc = "Running Debug: Step over",
		},
		{
			"<F11>",
			function() require("dap").step_into() end,
			desc = "Running Debug: Step into",
		},
		{
			"<F12>",
			function() require("dap").step_out() end,
			desc = "Running Debug: Step out",
		},
		{
			"<leader>dbb",
			function() require("dap").toggle_breakpoint() end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dbo",
			function()
				vim.ui.input({ prompt = "Condition to trigger breakpoint: " }, function(condition)
					vim.ui.input({ prompt = "Number of hits until breakpoint is triggered: " }, function(hit_condition)
						vim.ui.input({ prompt = "Log message to display when breakpoint is triggered: " }, function(log_message) require("dap").set_breakpoint(tostring(condition), tostring(hit_condition), tostring(log_message)) end)
					end)
				end)
			end,
			desc = "Toggle breakpoint with options",
		},
		{
			"<leader>dbi",
			function()
				require("dap").list_breakpoints()
				Snacks.picker.qflist()
			end,
			desc = "List breakpoints",
		},
		{
			"<Leader>dbl",
			function()
				vim.ui.input({ prompt = "Log point message" }, function(message) require("dap").set_breakpoint(nil, nil, tostring(message)) end)
			end,
			desc = "Set log point (shows in REPL)",
		},
		{
			"<leader>dbc",
			function() require("dap").clear_breakpoints() end,
			desc = "Clear breakpoints",
		},
		{
			"<leader>dve",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.expression)
			end,
			desc = "View expression",
		},
		{
			"<leader>dvf",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			desc = "View frames",
		},
		{
			"<leader>dvh",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.hover()
			end,
			desc = "View debug hover",
		},
		{
			"<leader>dvp",
			function() require("dap.ui.widgets").preview() end,
			mode = { "n", "v" },
			desc = "View preview",
		},
	},
	config = function()
		local dap, dv = require("dap"), require("dap-view")
		dap.listeners.before.attach["dap-view-config"] = function() dv.open() end
		dap.listeners.before.launch["dap-view-config"] = function() dv.open() end
		dap.listeners.before.event_terminated["dap-view-config"] = function() dv.close(true) end
		dap.listeners.before.event_exited["dap-view-config"] = function() dv.close(true) end

		-- Fixes jumping issue detailed here https://github.com/igorlfs/nvim-dap-view?tab=readme-ov-file#jumping
		require("dap").defaults.fallback.switchbuf = "useopen" -- See :h dap-defaults to learn more

		-- Define different icons for DAP stuff
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "Error", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn", linehl = "RedrawDebugClear", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Error", linehl = "", numhl = "" })

		-- nvim-dap-python setup
		-- uses the DebugPy installation by mason
		local debugpy_python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3"
		require("dap-python").setup(debugpy_python_path) ---@diagnostic disable-line: missing-fields

		-- bash-debug-adapter setup
		dap.adapters.bashdb = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
			name = "bashdb",
		}
		dap.configurations.sh = {
			{
				type = "bashdb",
				request = "launch",
				name = "Launch file",
				showDebugOutput = true,
				pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
				pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
				trace = true,
				file = "${file}",
				program = "${file}",
				cwd = "${workspaceFolder}",
				pathCat = "cat",
				pathBash = "/bin/bash",
				pathMkfifo = "mkfifo",
				pathPkill = "pkill",
				args = {},
				env = {},
				terminalKind = "integrated",
			},
		}
	end,
}
