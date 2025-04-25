return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = {},
	settings = {
		bashIde = {
			shellcheckPath = "", -- Disable shellcheck in bash-language-server. It conflicts with linter settings.
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
}
