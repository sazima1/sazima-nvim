return {
	settings = {
		bashIde = {
			shellcheckPath = "", -- Disable shellcheck in bash-language-server. It conflicts with linter settings.
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
}
