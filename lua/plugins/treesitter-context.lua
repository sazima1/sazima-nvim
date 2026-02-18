--[[
Name: Treesitter Context
Language: Anything with a treesitter parser
Description: View the current context (function, class, etc) that you are in with virtual text
--]]
return {
	"nvim-treesitter/nvim-treesitter-context",
	event = { "UIEnter" },
	keys = {
		{ "<leader><leader>t", "<Cmd>TSContextToggle<CR>", mode = "n", desc = "Toggle treesitter context" },
	},
	opts = {},
}
