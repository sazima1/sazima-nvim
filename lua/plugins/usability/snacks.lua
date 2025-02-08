-- The dashboard is configured in lua/plugins/cosmetic/snacks-dashboard.lua
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {},
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
				col = 0,
				width = 20,
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
