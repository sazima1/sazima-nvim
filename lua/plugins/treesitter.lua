--[[
Name: Nvim Treesitter
Language: N/A
Description: Better syntax highlighting with treesitter
--]]
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"cpp",
			"latex",
			"lua",
			"luadoc",
			"html",
			"json",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"rust",
			"toml",
			"typst",
			"vim",
			"vimdoc",
			"yaml",
		},
		ignore_install = {
			"man",
		},
		indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ingrid", "truegrid", "diablo" },
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
