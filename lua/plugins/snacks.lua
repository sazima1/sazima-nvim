--[[
Name: Snacks
Language: N/A
Description: Quality of life plugins for Neovim.
Notes:
  - Individual snacks components configured in snacks.<component>.lua
--]]
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {},
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = {
			enabled = true,
			animate = { enabled = false },
		},
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		styles = {
			notification = {
				wo = {
					wrap = true,
				},
			},
			input = {
				relative = "cursor",
				row = -3,
				col = -5,
				width = 60,
				title_pos = "left",
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		local usercmd = vim.api.nvim_create_user_command
		--stylua: ignore start
		usercmd("Bd", function() require("snacks").bufdelete() end, {})
		usercmd("Notifications", function() Snacks.notifier.show_history() end, {})
		--stylua: ignore end
	end,
}
