-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins.coding" },
		{ import = "plugins.colorschemes" },
		{ import = "plugins.cosmetic" },
		{ import = "plugins.files" },
		{ import = "plugins.git" },
		{ import = "plugins.usability" },
	},
	checker = { enabled = true },
	defaults = {
		-- lazy = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
