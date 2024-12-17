return {
	"bullets-vim/bullets.vim",
	config = function()
		local g = vim.g
		local map = vim.keymap.set

		g.bullets_renumber_on_change = 0
		map("n", "<leader>x", "<Nop>")
	end,
}
