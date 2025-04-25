--[[
Name: Markview
Language: markdown
Description: Nice inline markdown formatting without needing to render in a separate window
--]]
return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"raddari/last-color.nvim",
	},
	opts = function()
		local presets = require("markview.presets")
		local opts = {
			preview = {
				modes = { "n", "no", "c", "i" },
				hybrid_modes = { "i" },
			},
			markdown = {
				horizontal_rules = presets.horizontal_rules.thin,
				headings = presets.headings.glow,
				-- headings = presets.headings.slanted,
				-- headings = presets.headings.simple,
				checkboxes = presets.checkboxes.nerd,
				list_items = {
					-- shift_width = 2,
					indent_size = 4,
					marker_minus = { add_padding = false },
					marker_plus = { add_padding = false },
					marker_star = { add_padding = false },
					marker_dot = { add_padding = false },
					marker_parenthesis = { add_padding = false },
				},
			},
		}
		opts.markdown.headings.heading_1.icon = "# "
		opts.markdown.headings.heading_2.icon = "## "
		opts.markdown.headings.heading_3.icon = "### "
		opts.markdown.headings.heading_4.icon = "#### "
		opts.markdown.headings.heading_5.icon = "##### "
		opts.markdown.headings.heading_6.icon = "###### "
		-- opts.markdown.headings.heading_1.icon = " "
		-- opts.markdown.headings.heading_2.icon = " "
		-- opts.markdown.headings.heading_3.icon = " "
		-- opts.markdown.headings.heading_4.icon = " "
		-- opts.markdown.headings.heading_5.icon = " "
		-- opts.markdown.headings.heading_6.icon = " "
		-- opts.markdown.headings.heading_1.icon = " "
		-- opts.markdown.headings.heading_2.icon = " "
		-- opts.markdown.headings.heading_3.icon = " "

		-- opts.markdown.headings.heading_1.icon = "│ "
		-- opts.markdown.headings.heading_2.icon = "││ "
		-- opts.markdown.headings.heading_3.icon = "│││ "
		-- opts.markdown.headings.heading_4.icon = "││││ "
		-- opts.markdown.headings.heading_5.icon = "│││││ "
		-- opts.markdown.headings.heading_6.icon = "││││││ "
		-- Heading colors get messed up unless you reload the colorscheme.
		local theme = require("last-color").recall() or "tokyonight"
		vim.cmd.colorscheme(theme)
		return opts
	end,
}
