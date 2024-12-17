return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
		})
		local maps = {
			-- Groups
			{ "<leader>b", desc = "Bookmarks (Spelunk)", icon = "" },
			{ "<leader>d", desc = "Debugging" },
			{ "<leader>f", desc = "File Actions" },
			{ "<leader>g", desc = "Git" },
			{ "<leader>l", desc = "Code Outline (Aerial)" },
			{ "<leader>m", desc = "Multiple Cursors", icon = "" },
			{ "<leader>q", desc = "Session Actions (Persistence)" },
			{ "<leader>t", desc = "Terminal Actions (ToggleTerm)" },
			{ "<leader>x", desc = "Diagnostics" },
			{ "<leader>y", desc = "Code Actions", icon = "" },
			{ "<leader>yd", desc = "Docstrings/Annotations", icon = "" },
			{ "<leader>z", desc = "Notes Actions (Zk)", icon = "" },
			{ "<leader><leader>", desc = "Editor Actions", icon = "" },
			-- Individual maps that need more info
			{ "<leader><leader>d", desc = "Toggle signature docked or floating window" },
			{ "<leader>yr", icon = "" },
			{ "<leader>u", icon = "" },
			{ "<leader>n", icon = "󰒭" },
			{ "<leader>p", icon = "󰒮" },
			{ "<leader>o", icon = "󰈢" },
		}

		wk.add(maps, {})
	end,
}
