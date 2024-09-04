return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			run_on_start = true, -- use :MasonToolsInstall or :MasonToolsUpdate
			ensure_installed = {
				"shfmt",
				"markdown-toc",
				"markdown_oxide",
				"markdownlint",
				"shellcheck",
				"stylua",
				"vale_ls",
				"vale",
				"basedpyright",
				"bash-debug-adapter",
				"bashls",
				"beautysh",
				"black",
				"debugpy",
				"isort",
				"flake8",
				"latexindent",
				"ltex",
				"lua_ls",
				"matlab_ls",
				"mypy",
				"perlnavigator",
				"prettier",
				"pydocstyle",
				"pyflakes",
				"pylint",
				"selene",
			},
		})
	end,
}
