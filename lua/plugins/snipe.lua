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
			-- sort = "last",
		},
		hints = {
			dictionary = "asdfgwerxcvhmlio",
		},
		navigate = {
			cancel_snipe = "q",
		},
	},
	keys = {
		{
			"<leader>o",
			function()
				local filetype = vim.bo.filetype
				local filetypes_to_check_for = {
					"snacks_dashboard",
				}
				for _, b in ipairs(filetypes_to_check_for) do
					if filetype ~= b then
						require("snipe").open_buffer_menu()
					end
				end
			end,
			mode = { "n" },
			noremap = true,
			desc = "Open Snipe buffer menu",
		},
	},
}
