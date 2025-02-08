return {
	"bullets-vim/bullets.vim",
	event = "VeryLazy",
	config = function()
		local g = vim.g
		local map = vim.keymap.set

		g.bullets_renumber_on_change = 0
		map("n", "<leader>x", "<Nop>")
	end,
}
