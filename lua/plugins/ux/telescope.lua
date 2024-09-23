return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"zane-/cder.nvim",
		"debugloop/telescope-undo.nvim",
	},
	keys = {
		{
			"<leader>cd",
			"<cmd>Telescope cder<CR>",
			mode = "n",
			{ noremap = true, desc = "Changing current working directory" },
		},
		{
			"<leader>u",
			"<cmd>Telescope undo<CR>",
			mode = "n",
			{ noremap = true, desc = "Changing current working directory" },
		},
		{
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
			mode = "n",
			{ noremap = true, desc = "Find files with Telescope" },
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<CR>",
			mode = "n",
			{ noremap = true, desc = "Live grep with Telescope" },
		},
		{
			"<leader>kt",
			"<cmd>Telescope colorscheme<CR>",
			mode = "n",
			{ noremap = true, desc = "Change colorscheme with Telescope" },
		},
	},
	config = function()
		require("telescope").setup({
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
						"--max-depth=4",
						"--search-path",
						os.getenv("HOME"),
						"--search-path",
						os.getenv("WORKSPACE"),
						"--search-path",
						os.getenv("LUSTRE"),
					},
					pager_command = "bat",
					previewer_command = "ls -a --color=always",
				},
			},
		})
		require("telescope").load_extension("cder")
		require("telescope").load_extension("undo")
	end,
}
