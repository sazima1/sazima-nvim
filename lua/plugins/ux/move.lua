return {
	"fedepujol/move.nvim",
	config = function()
		require("move").setup({})

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<C-down>", ":MoveLine(1)<CR>", opts)
		map("n", "<C-up>", ":MoveLine(-1)<CR>", opts)

		map("v", "<C-down>", ":MoveBlock(1)<CR>", opts)
		map("v", "<C-up>", ":MoveBlock(-1)<CR>", opts)
	end,
}
