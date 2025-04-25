return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	root_markers = { "" },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
}
