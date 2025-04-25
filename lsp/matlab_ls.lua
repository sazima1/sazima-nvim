return {
	cmd = { "matlab-language-server", "--stdio" },
	filetypes = { "matlab" },
	root_markers = {},
	settings = {
		MATLAB = {
			indexWorkspace = false,
			installPath = "",
			matlabConnectionTiming = "onStart",
			telemetry = true,
		},
	},
}
