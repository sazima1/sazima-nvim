return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
	},
	settings = {
		basedpyright = {
			analysis = {
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				disableOrganizeImports = true,
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
	capabilities = {
		textDocument = {
			hoverProvider = false,
		},
	},
}
