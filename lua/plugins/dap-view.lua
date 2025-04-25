--[[
Name: Nvim DAP view
Language: N/A
Description: Nice, minimalistic debug view. Much less cluttered than nvim-dap-ui (mimics VSCode)
--]]
return {
	"igorlfs/nvim-dap-view",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	keys = {
		{
			"<leader>dw",
			function()
				require("dap-view").add_expr()
			end,
			desc = "Add current word under the cursor the Watches list",
		},
	},
	opts = {
		winbar = {
			-- default_section = "scopes",
		},
		windows = {
			height = 15,
			terminal = {
				position = "right",
				-- width = 0.33,
			},
		},
	},
}
