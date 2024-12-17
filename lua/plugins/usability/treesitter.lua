return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"python",
			"lua",
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
			"latex",
			"luadoc",
		},
		indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
