return {
	"leath-dub/snipe.nvim",
	config = function()
		require("snipe").setup({
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
		})

		-- Keymaps
		local map = vim.keymap.set

		-- map({ "n" }, "<leader>fo", function()
		-- 	require("snipe").open_buffer_menu()
		-- end, { noremap = true, desc = "Open Snipe buffer menu" })
		map({ "n" }, "<leader>o", function()
			require("snipe").open_buffer_menu()
		end, { noremap = true, desc = "Open Snipe buffer menu" })
	end,
}
