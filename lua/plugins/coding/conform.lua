return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufWritePre", "BufReadPre", "BufNewFile" },
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			bibtex = { "bibtex-tidy" },
			json = { "prettierd" },
			latex = { "latexindent" },
			lua = { "stylua" },
			markdown = { "prettierd", "markdownlint", "markdown-toc" },
			python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
			sh = { "shfmt" },
			yaml = { "yamlfix", "yamlfmt" },
		},
		-- format_on_save = {
		-- 	-- These options will be passed to conform.format()
		-- 	timeout_ms = 500,
		-- 	lsp_format = "fallback",
		-- },
		formatters = {
			markdownlint = {
				prepend_args = { "--config", "~/.config/nvim/markdownlint.toml" },
			},
			ruff_fix = {
				append_args = { "--ignore", "F401" }, -- Don't fix unused imports
			},
		},
	},
	keys = {
		{ "<leader>yf", '<cmd>lua require("conform").format()<CR>', mode = { "n" }, noremap = true, desc = "Run formatter" },
	},
}
