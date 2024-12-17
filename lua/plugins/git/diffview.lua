return {
	"sindrets/diffview.nvim",
	opts = {
		git_cmd = { os.getenv("HOME") .. "/bin/git" },
		view = {
			merge_tool = {
				layout = "diff3_mixed",
				-- layout = "diff4_mixed"
			},
		},
	},
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<CR>", mode = "n", noremap = true, desc = "Open Diffview" },
		{ "<leader>gc", "<cmd>DiffviewClose<CR>", mode = "n", noremap = true, desc = "Close Diffview" },
	},
}
