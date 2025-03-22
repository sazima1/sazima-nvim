--[[
Name: Trouble
Language: N/A
Description: LSP diagnostics window
--]]
return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle<cr>",
			mode = { "n" },
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			mode = { "n" },
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			mode = { "n" },
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			mode = { "n" },
			desc = "Quickfix List (Trouble)",
		},
		{
			"<leader>xd",
			"<cmd>Trouble todo toggle<cr>",
			mode = { "n" },
			desc = "Todo Comments List (Trouble)",
		},
		{
			"<leader>xf",
			"<Cmd>lua vim.diagnostic.open_float()<CR>",
			mode = { "n" },
			desc = "Show floating diagnostic window for current diagnostic(s) under the cursor",
		},
	},
}
