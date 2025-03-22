--[[
Name: Move
Language: N/A
Description: Move lines up and down without needing to use d and p
--]]
return {
	"fedepujol/move.nvim",
	keys = {
		{ "<A-down>", ":MoveLine(1)<CR>", mode = "n", noremap = true, silent = true },
		{ "<A-up>", ":MoveLine(-1)<CR>", mode = "n", noremap = true, silent = true },
		{ "<A-down>", ":MoveBlock(1)<CR>", mode = "v", noremap = true, silent = true },
		{ "<A-up>", ":MoveBlock(-1)<CR>", mode = "v", noremap = true, silent = true },
	},
	opts = {},
}
