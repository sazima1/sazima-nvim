return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua vim.cmd([[execute 'cd ' stdpath('config')]]) Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{
					section = "header",
				},
				{
					section = "startup",
					align = "center",
					padding = 3,
				},
				{
					icon = " ",
					title = "Actions",
					section = "keys",
					indent = 2,
					padding = 1,
				},
				{
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 3,
				},
				{
					text = {
						{ "Perfect", hl = "Title" },
						{ " is the " },
						{ "mortal enemy", hl = "Title" },
						{ " of " },
						{ "Good Enough", hl = "Title" },
					},
					align = "center",
				},
			},
		},
		indent = {
			enabled = true,
			animate = { enabled = false },
		},
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
	},
	config = function(_, opts)
		function make_todo_text(section_table)
			updated_section_table = table.insert(section_table.text, { "ye" })
			return updated_section_table
		end
		todo_section_text = {
			pane = 2,
			title = "To Do",
			text = {},
		}
		opts_extended = make_todo_text(todo_section_text)
		table.insert(opts.dashboard.sections, opts_extended)
		require("snacks").setup(opts)
	end,
}
