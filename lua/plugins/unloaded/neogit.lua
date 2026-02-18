--[[
Name: Neogit
Language: N/A
Description: Great git functionality in Vim
Notes:
  - I am testing this as of April 24 2025
--]]
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	keys = {
		{
			"<leader>gg",
			function()
				require("neogit").open()
			end,
			mode = "n",
			noremap = true,
			desc = "Open Neogit",
		},
	},
}
