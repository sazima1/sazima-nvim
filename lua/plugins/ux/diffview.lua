return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			git_cmd = { os.getenv("HOME") .. "/bin/git" },
		})
	end,
}
