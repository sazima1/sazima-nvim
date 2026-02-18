--[[
Name: Todo Comments
Language: N/A
Description: Highlight and keep track of comments with certain string headers. Best for notes and todos.
--]]
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	opts = {
		highlight = {
			exclude = { "bigfile" },
		},
	},
	keys = {
		{ "]t", function() require("todo-comments").jump_next() end, mode = "n", desc = "Next todo comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, mode = "n", desc = "Previous todo comment" },
		{ "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
		{ "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
	},
	init = function() TODO_COMMENTS_LOADED = true end,
}
