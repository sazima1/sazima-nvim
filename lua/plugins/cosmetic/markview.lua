return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"raddari/last-color.nvim",
	},
	opts = function()
		local presets = require("markview.presets")
		local opts = {
			modes = { "n", "no", "c", "i" },
			hybrid_modes = { "i" },
			list_items = {
				shift_width = 0,
				indent_size = 4,
				marker_minus = { add_padding = false },
				marker_plus = { add_padding = false },
				marker_star = { add_padding = false },
				marker_dot = { add_padding = false },
				marker_parenthesis = { add_padding = false },
			},
			horizontal_rules = presets.horizontal_rules.thin,
			headings = presets.headings.glow,
			checkboxes = presets.checkboxes.nerd,
		}
		return opts
	end, -- -- Heading colors get messed up unless you reload the colorscheme.
	-- local theme = require("last-color").recall() or "tokyonight"
	-- vim.cmd.colorscheme(theme)
}
