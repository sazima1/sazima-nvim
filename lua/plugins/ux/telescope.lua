return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"zane-/cder.nvim",
	},
	keys = {
		{
			"<leader>cd",
			"<cmd>Telescope cder<CR>",
			mode = "n",
			{ noremap = true, desc = "Changing current working directory" },
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<CR>",
			mode = "n",
			{ noremap = true, desc = "Find files with Telescope" },
		},
		{
			"<leader>fg",
			"<cmd>Telescope grep_string<CR>",
			mode = "n",
			{ noremap = true, desc = "Find files with Telescope" },
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
						"--type=l",
						"--search-path",
						os.getenv("HOME"),
						"--search-path",
						os.getenv("WORKSPACE"),
						"--search-path",
						os.getenv("LUSTRE"),
					},
					-- dir_command = {
					-- 	"fd",
					-- 	"--hidden",
					-- 	"--type",
					-- 	"directory",
					-- 	"--type",
					-- 	"symlink",
					-- 	"--search-path",
					-- 	"$HOME",
					-- 	"--search-path",
					-- 	"$WORKSPACE",
					-- 	"--search-path",
					-- 	"$LUSTRE"
					-- },
					pager_command = "bat",
					previewer_command = "ls -a --color=always",
				},
			},
		})
		pcall(require("telescope").load_extension("cder"))
	end,
}
