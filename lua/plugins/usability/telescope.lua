return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"zane-/cder.nvim",
		"debugloop/telescope-undo.nvim",
		-- "JoseConseco/telescope_sessions_picker.nvim",
	},
	keys = {
		{
			"<leader>cd",
			"<Cmd>Telescope cder<CR>",
			mode = "n",
			noremap = true,
			desc = "Changing current working directory",
		},
		{
			"<leader>u",
			"<cmd>Telescope undo<CR>",
			mode = "n",
			noremap = true,
			desc = "Open undo list (Telescope)",
		},
		{
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
			mode = "n",
			noremap = true,
			desc = "Find files with Telescope",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<CR>",
			mode = "n",
			noremap = true,
			desc = "Live grep with Telescope",
		},
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
		},
		extensions = {
			cder = {
				dir_command = {
					"fd",
					"--type=d",
					"--max-depth=6",
					"--search-path",
					os.getenv("HOME"),
					"--search-path",
					os.getenv("WORKSPACE"),
					"--search-path",
					os.getenv("LUSTRE"),
					"--hidden",
					"--search-path",
					"~/.sazima1/",
				},
				pager_command = "bat",
				previewer_command = "ls -a --color=always",
			},
			persisted = {
				layout_config = { width = 0.55, height = 0.75 },
			},
		},
		pickers = {
			help_tags = {},
		},
	},
}
