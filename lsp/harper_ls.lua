return {
	cmd = { "harper-ls", "--stdio" },
	filetypes = {
		"bash",
		"cmake",
		"diablo",
		"gitcommit",
		"html",
		"ingrid",
		"latex",
		"lua",
		"markdown",
		"plaintex",
		"plaintext",
		"python",
		"rust",
		"sh",
		"tex",
		"text",
		"toml",
		"typst",
	},
	root_markers = {},
	settings = {
		["harper-ls"] = {
			linters = {
				sentence_capitalization = false,
				long_sentences = false,
			},
		},
	},
}
