return {
	"echasnovski/mini.files",
	version = false,
	config = function()
		require("mini.files").setup({})

		-- Keymaps
		local map = vim.keymap.set

		map(
			"n",
			"<leader>mf",
			"<cmd>lua MiniFiles.open()<CR>",
			{ noremap = true, desc = "Open mini.files file explorer" }
		)
	end,
}
