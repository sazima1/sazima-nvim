return {
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
