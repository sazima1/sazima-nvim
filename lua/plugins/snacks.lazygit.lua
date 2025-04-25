--[[
Name: Snacks LazyGit
Language: N/A
Description: LazyGit directly inside Neovim
Notes:
  - This is only the LazyGit component of the Snacks plugin
--]]
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>gl",
			function()
				Snacks.lazygit({ win = { width = 0.99, height = 0.99 } })
			end,
			mode = { "n" },
			desc = "Open LazyGit",
		},
	},
	opts = {
		lazygit = { enabled = true },
	},
}
