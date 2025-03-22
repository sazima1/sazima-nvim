--[[
Name: Snipe
Language: N/A
Description: Quick file changing menu based on open buffers (unlike the manual addition of buffers to a list like Harpoon)
--]]
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
