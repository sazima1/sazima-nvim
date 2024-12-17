return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<CR>", mode = "n", noremap = true, desc = "Open Neogit" },
	},
}
