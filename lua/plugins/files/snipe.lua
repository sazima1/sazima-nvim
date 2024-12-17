return {
	"leath-dub/snipe.nvim",
	opts = {
		ui = {
			position = "cursor",
			open_win_override = {
				title = " Open Buffers ",
				border = "rounded",
			},
			text_align = "file-first",
			preselect_current = true,
		},
		hints = {
			dictionary = "asdfglewcmphio",
		},
		-- sort = "last",
	},
	keys = {
		{
			"<leader>o",
			function()
				require("snipe").open_buffer_menu()
			end,
			mode = { "n" },
			noremap = true,
			desc = "Open Snipe buffer menu",
		},
	},
}
