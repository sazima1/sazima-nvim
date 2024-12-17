return {
	"fedepujol/move.nvim",
	config = function()
		require("move").setup()

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<A-down>", ":MoveLine(1)<CR>", opts)
		map("n", "<A-up>", ":MoveLine(-1)<CR>", opts)

		map("v", "<A-down>", ":MoveBlock(1)<CR>", opts)
		map("v", "<A-up>", ":MoveBlock(-1)<CR>", opts)
	end,
}
