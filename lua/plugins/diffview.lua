--[[
Name: Diffview
Language: N/A
Description: Pretty diff view in nvim
Notes:
  - I may remove this plugin as I am using LazyGit more and more. This might just never get used.
  - This plugin is just useful for merge conflicts, but again, LazyGit might just be better.
--]]
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
