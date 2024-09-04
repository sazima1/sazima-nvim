return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufWritePre", "BufReadPre", "BufNewFile" },
	cmd = "ConformInfo",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				sh = { "shfmt" },
				latex = { "latexindent" },
				bibtex = { "bibtex-tidy" },
				markdown = { "prettier", "markdownlint", "markdown-toc" },
				yaml = { "prettier" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			-- formatters = {
			-- 	python = {
			-- 		command = "black",
			-- 		args = { "--line_length=100", "-" },
			-- 		stdin = true,
			-- 	},
			-- },
		})
	end,
}
