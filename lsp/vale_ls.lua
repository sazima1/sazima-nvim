return {
	cmd = { os.getenv("HOME") .. "/bin/vale-ls" },
	filetypes = { "markdown", "text", "tex", "rst" },
	root_markers = { ".vale.ini" },
	settings = {
		filetypes = { "latex", "plaintex", "tex", "text" },
	},
}
