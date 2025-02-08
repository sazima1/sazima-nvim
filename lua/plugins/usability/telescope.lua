return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"zane-/cder.nvim",
		"debugloop/telescope-undo.nvim",
		-- "JoseConseco/telescope_sessions_picker.nvim",
	},
	cmd = "Telescope",
	keys = {
		{
			"<leader><leader>c",
			"<Cmd>Telescope cder<CR>",
			mode = "n",
			noremap = true,
			desc = "Changing current working directory (Telescope)",
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
					"--max-depth=2",
					"--search-path",
					os.getenv("HOME"),
					"--search-path",
					os.getenv("WORKSPACE"),
					"--search-path",
					os.getenv("WORKSPACE") .. "projects",
					"--search-path",
					os.getenv("LUSTRE"),
					"--hidden",
					"--search-path",
					os.getenv("HOME") .. ".sazima1",
				},
				pager_command = "bat",
				previewer_command = "ls -a --color=always",
				entry_maker = function(line)
					return {
						value = line,
						display = function(entry)
							return "  " .. line:gsub(os.getenv("HOME") .. "/", "~/"), { { { 1, 3 }, "Directory" } }
						end,
						ordinal = line,
					}
				end,
			},
		},
		pickers = {
			help_tags = {},
		},
	},
}
