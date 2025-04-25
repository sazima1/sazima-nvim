return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = {},
	settings = {
		["rust-analyzer"] = {
			-- check = {
			-- 	command = "clippy",
			-- },
			-- checkOnSave = {
			-- 	command = "clippy",
			-- },
			diagnostics = {
				enable = true,
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
}
