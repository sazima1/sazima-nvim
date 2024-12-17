return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({})
		TODO_COMMENTS_LOADED = true
		-- Keymaps
		local map = vim.keymap.set

		map("n", "]t", function()
			require("todo-comments").jump_next()
		end, { desc = "Next todo comment" })

		map("n", "[t", function()
			require("todo-comments").jump_prev()
		end, { desc = "Previous todo comment" })
	end,
}
