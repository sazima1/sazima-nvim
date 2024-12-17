return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			git_cmd = { os.getenv("HOME") .. "/bin/git" },
			view = {
				merge_tool = {
					layout = "diff3_mixed",
					-- layout = "diff4_mixed"
				},
			},
		})

		-- Keymaps
		local map = vim.keymap.set

		map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { noremap = true, desc = "Open Diffview" })
		map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { noremap = true, desc = "Close Diffview" })
	end,
}
