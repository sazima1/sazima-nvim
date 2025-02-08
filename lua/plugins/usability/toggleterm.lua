return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- enabled = false,
	keys = {
		{ [[<C-\>]], "<Cmd>ToggleTerm<CR>", mode = "n", "Open terminal" },
		{ "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", mode = "n", desc = "Open terminal with direction = horizontal" },
		{ "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", mode = "n", desc = "Open terminal with direction = vertical" },
		{ "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", mode = "n", desc = "Open terminal in a floating window" },
		{ "<C-space>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode", buffer = 0 },
		{ "<esc>", [[<C-\><C-n>]], mode = "t", desc = "Exit terminal mode", buffer = 0 },
		-- {  "jk", [[<C-\><C-n>]], mode="t",desc = "Exit terminal mode", buffer = 0 },
		{ "<C-h>", [[<Cmd>wincmd h<CR>]], mode = "t", desc = "Move out of terminal to the left", buffer = 0 },
		{ "<C-j>", [[<Cmd>wincmd j<CR>]], mode = "t", desc = "Move out of terminal downward", buffer = 0 },
		{ "<C-k>", [[<Cmd>wincmd k<CR>]], mode = "t", desc = "Move out of terminal upward", buffer = 0 },
		{ "<C-l>", [[<Cmd>wincmd l<CR>]], mode = "t", desc = "Move out of terminal to the right", buffer = 0 },
		{ "<C-w>", [[<C-\><C-n><C-w>]], mode = "t", desc = "Move out of terminal to the floating window", buffer = 0 },
	},
	opts = {
		open_mapping = [[<C-\>]],
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.25
			end
		end,
		direction = "vertical",
	},
}
