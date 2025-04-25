--[[
Name: Whichkey
Language: N/A
Description: Easy keymap wayfinding
--]]
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
		icons = {
			rules = {
				{ pattern = "grep", icon = " " },
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")

		wk.setup(opts)

		local maps = {
			-- Groups
			{ "<leader>d", desc = "Debugging" },
			{ "<leader>f", desc = "Files" },
			{ "<leader>g", desc = "Git Actions" },
			-- { "<leader>l", desc = "Code Outline" },
			{ "<leader>s", desc = "Search" },
			{ "<leader>t", desc = "Terminal" },
			{ "<leader>x", desc = "Diagnostics" },
			{ "<leader>y", desc = "Code and Text", icon = "" },
			{ "<leader>yd", desc = "Docstrings/Annotations", icon = "" },
			{ "<leader>z", desc = "Notes Actions (Zk)", icon = "" },
			{ "<leader><leader>", desc = "Editor Actions", icon = "" },
			{ "<leader><leader>r", desc = "Performance Profiling", icon = "" }, --, icon = "" },
			-- Individual maps that need different icons
			{ "<leader>gl", icon = "" },
			{ "<leader>h", icon = "󰋖" },
			{ "<leader>n", icon = "󰒭" },
			{ "<leader>o", icon = "󰈢" },
			{ "<leader>p", icon = "󰒮" },
			{ "<leader>u", icon = "" },
			{ "<leader>yr", icon = "" },
			{ "<leader>:", icon = "" },
			{ "<leader><leader>c", icon = "" },
			{ "<leader><leader>d", icon = "󰕮" },
			{ "<leader>sa", icon = "" },
			{ "<leader>sc", icon = "" },
			{ "<leader>si", icon = "" },
			{ "<leader>sj", icon = "" },
			{ "<leader>sk", icon = "" },
			{ "<leader>sl", icon = "" },
			{ "<leader>sL", icon = "" },
			{ "<leader>sm", icon = "" },
			{ "<leader>sM", icon = "" },
			{ "<leader>sn", icon = "" },
			{ "<leader>sp", icon = "󱐥" },
			{ "<leader>sq", icon = "" },
			{ "<leader>sR", icon = "" },
			{ "<leader>st", icon = "" },
			{ "<leader>sT", icon = "" },
			{ "<leader>sw", icon = "" },
			{ '<leader>s"', icon = "" },
			{ "<leader>s/", icon = "󱩾" },
		}
		wk.add(maps, {})
	end,
}
