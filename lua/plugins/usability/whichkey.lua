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
	opts = {
		preset = "helix",
	},
	config = function(_, opts)
		local wk = require("which-key")

		wk.setup(opts)

		local maps = {
			-- Groups
			-- { "<leader>b", desc = "Bookmarks (Spelunk)", icon = "" },
			{ "<leader>d", desc = "Debugging" },
			{ "<leader>f", desc = "Files" },
			{ "<leader>g", desc = "Git" },
			{ "<leader>l", desc = "Code Outline (Aerial)" },
			{ "<leader>m", desc = "Multiple Cursors", icon = "" },
			{ "<leader>t", desc = "Terminal (ToggleTerm)" },
			{ "<leader>x", desc = "Diagnostics" },
			{ "<leader>y", desc = "Code and Text", icon = "" },
			{ "<leader>yd", desc = "Docstrings/Annotations", icon = "" },
			{ "<leader>z", desc = "Notes Actions (Zk)", icon = "" },
			{ "<leader><leader>", desc = "Editor Actions", icon = "" },
			{ "<leader><leader>p", desc = "Performance Profiling" }, --, icon = "" },
			-- Individual maps that need more info
			{ "<leader>yr", icon = "" },
			{ "<leader>u", icon = "" },
			{ "<leader>n", icon = "󰒭" },
			{ "<leader>p", icon = "󰒮" },
			{ "<leader>o", icon = "󰈢" },
		}
		wk.add(maps, {})
	end,
}
