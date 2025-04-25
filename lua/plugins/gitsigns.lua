--[[
Name: Git Signs
Language: N/A
Description: Statuscol display of added, changed, and removed lines when in a git repo
--]]
return {
	"lewis6991/gitsigns.nvim",
	opts = {},
	keys = {
		{
			"<leader>gb",
			"<cmd>Gitsigns blame<CR>",
			mode = "n",
			noremap = true,
			desc = "Open Git Blame",
		},
		{
			"<leader>gB",
			"<cmd>Gitsigns blame_line<CR>",
			mode = "n",
			noremap = true,
			desc = "Show git blame for current line",
		},
		{
			"<leader>gi",
			"<cmd>Gitsigns toggle_word_diff<CR>",
			mode = "n",
			noremap = true,
			desc = "Toggle inline diff (Gitsigns)",
		},
	},
}
