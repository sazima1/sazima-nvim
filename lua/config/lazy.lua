-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true },
	defaults = {
		-- lazy = true,
	},
	rocks = { enabled = false },
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
