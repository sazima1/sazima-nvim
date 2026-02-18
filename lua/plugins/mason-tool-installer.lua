--[[
Name: Mason Tool Installer
Language: N/A
Description: Install any tool with Mason, not just LSP (Mason "ensure_installed" only installs LSP currently)
Notes:
  - This plugin could be replaced in the future if this functionality is built into mason or another tool takes over
--]]
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	lazy = true,
	cmd = { "MasonToolsInstall", "MasonToolsUninstall", "MasonToolsUpdate", "MasonToolsUpdateSync", "MasonToolsClean" },
	opts = {
		run_on_start = false, -- use :MasonToolsInstall or :MasonToolsUpdate
		ensure_installed = {
			"basedpyright",
			"bash-debug-adapter",
			"bash-language-server",
			"beautysh",
			"bibtex-tidy",
			"debugpy",
			"jedi-language-server",
			"latexindent",
			"lua-language-server",
			"markdown-toc",
			"markdown-oxide",
			"markdownlint",
			"marksman",
			--mypy should be installed per-venv
			"prettierd",
			"pyproject-fmt",
			"ruff",
			"selene",
			"shellcheck",
			"shfmt",
			-- "stylua", -- not installed due to glibc version error. Installed with cargo
			-- "texlab", -- not installed due to glibc version error. Built manually
			-- "vale_ls", -- not installed due to glibc version error. Built manually
			"vim-language-server",
			"yaml-language-server",
			"yamlfix",
			"yamlfmt",
			"yamllint",
		},
	},
}
