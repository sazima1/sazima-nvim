return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				-- LSP
				"bashls",
				"jsonls",
				"lua_ls",
				"markdown_oxide",
				"matlab_ls",
				"perlnavigator",
				"pyright",
				"texlab",
				"yamlls",
				-- debuggers
				"bash-debug-adapter",
				"debugpy",
				-- formatters and linters
				"ruff",
				"markdownlint",
				"prettier",
				"stylua",
				"markdown-toc",
				"selene",
				"shellcheck",
				"vale",
				"bibtex-tidy",
				"latexindent",
				"shfmt",
				"stylua",
			},
		})
	end,
}
