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
			function() require("which-key").show() end,
			desc = "Show all keymaps (which-key)",
		},
	},
	opts = {
		preset = "helix",
		icons = {
			rules = {
				{ pattern = "grep", icon = " " },
			},
		},
		triggers = {
			{ "r", mode = { "n", "v" } }, -- add trigger for mini.surround (conflicts with builtin "replace" on 'r')
			{ "<leader>s", mode = { "n" } }, -- add trigger for Snacks search pickers (conflicts with Flash on 's')
			{ "<leader>", mode = { "n" } }, -- idk this just stopped working
		},
	},
	config = function(_, opts)
		local wk = require("which-key")

		wk.setup(opts)

		local maps = {
			-- Groups
			{ "<leader>d", group = "Debugging" },
			{ "<leader>db", group = "Breakpoints", icon = { icon = "", hl = "Error" } },
			{ "<leader>dv", group = "View" },
			{ "<leader>f", group = "Files" },
			{ "<leader>g", group = "Git Actions" },
			-- { "<leader>l", group = "Code Outline" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Terminal" },
			{ "<leader>x", group = "Diagnostics" },
			{ "<leader>y", group = "Code and Text", icon = "" },
			{ "<leader>yd", group = "Docstrings/Annotations", icon = "" },
			{ "<leader>z", group = "Notes Actions (Zk)", icon = "" },
			{ "<leader><leader>", group = "Editor Actions", icon = "" },
			{ "<leader><leader>r", group = "Performance Profiling", icon = "" }, --, icon = "" },
			-- Individual maps that need different icons
			{ "<leader>a", icon = "" },
			{ "<leader>A", icon = "" },
			{ "<leader>dd", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>do", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>di", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>dn", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>dp", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>dr", icon = { icon = "", hl = "DiagnosticOk" } },
			{ "<leader>dt", icon = { icon = "", hl = "Error" } },
			{ "<leader>dbb", icon = { icon = "", hl = "Error" } },
			{ "<leader>dbc", icon = { icon = "", hl = "DiagnosticWarn" } },
			{ "<leader>dbi", icon = { icon = "" } },
			{ "<leader>dbl", icon = { icon = "", hl = "Error" } },
			{ "<leader>dbo", icon = { icon = "", hl = "Error" } },
			{ "<leader>fb", icon = "" },
			{ "<leader>fe", icon = "" },
			{ "<leader>ff", icon = "" },
			{ "<leader>fm", icon = "" },
			{ "<leader>gb", icon = "" },
			{ "<leader>gB", icon = "" },
			{ "<leader>gd", icon = "" },
			{ "<leader>gD", icon = "" },
			{ "<leader>gf", icon = "" },
			{ "<leader>gF", icon = "" },
			{ "<leader>gl", icon = "" },
			{ "<leader>m", icon = "" },
			{ "<leader>M", icon = "" },
			{ "<leader>n", icon = "󰒭" },
			{ "<leader>o", icon = "󰈢" },
			{ "<leader>p", icon = "󰒮" },
			{ "<leader>r", icon = "" },
			{ "<leader>R", icon = "" },
			{ "<leader>sa", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sb", icon = { hl = "WhichKeyIconPurple" } },
			{ "<leader>sc", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sG", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sh", icon = { icon = "󰋖", hl = "WhichKeyIconAzure" } },
			{ "<leader>sH", icon = { icon = "󰋖", hl = "WhichKeyIconAzure" } },
			{ "<leader>si", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sj", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sk", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sl", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sL", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sm", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sM", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sn", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>so", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sp", icon = { icon = "󱐥", hl = "WhichKeyIconAzure" } },
			{ "<leader>sq", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sR", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>ss", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>st", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sT", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>su", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>sw", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ '<leader>s"', icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>s/", icon = { icon = "󱩾", hl = "WhichKeyIconAzure" } },
			{ "<leader>s:", icon = { icon = "", hl = "WhichKeyIconAzure" } },
			{ "<leader>u", icon = "" },
			{ "<leader>yr", icon = "" },
			{ "<leader>:", icon = "" },
			{ "<leader><leader>c", icon = "" },
			{ "<leader><leader>d", icon = "󰕮" },
			{ "<leader><leader>t", icon = "" },
			{ "<leader><leader>w", icon = "󰖶" },
		}
		wk.add(maps, {})
	end,
}
