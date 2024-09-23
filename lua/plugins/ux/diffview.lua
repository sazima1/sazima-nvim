return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			git_cmd = { os.getenv("HOME") .. "/bin/git" },
			merge_tool = {
				-- layout = "diff3_horizontal"
				layout = "diff3_mixed",
				-- layout = "diff4_mixed"
			},
		})

		-- Keymaps
		local map = vim.keymap.set

		map("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { noremap = true, desc = "Open Diffview" })
		map("n", "<leader>dvc", "<cmd>DiffviewClose<CR>", { noremap = true, desc = "Close Diffview" })
	end,
}
