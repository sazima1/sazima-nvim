return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({})

		-- Keymaps
		local map = vim.keymap.set

		map("n", "<leader>gg", "<cmd>Neogit<CR>", { noremap = true, desc = "Open Neogit" })
	end,
}
