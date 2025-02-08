return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>gl",
			function()
				Snacks.lazygit()
			end,
			mode = { "n" },
			desc = "Open LazyGit",
		},
	},
	opts = {
		lazygit = { enabled = true },
	},
}
