return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			mode = "n",
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			mode = "n",
			desc = "Previous todo comment",
		},
	},
	init = function()
		TODO_COMMENTS_LOADED = true
	end,
}
