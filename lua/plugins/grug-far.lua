--[[
Name: Grug Far
Language: N/A
Description: Like the "Search" tab in VSCode. Full workspace grep and replace
--]]
return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	opts = {},
	keys = {
		{ "<leader>sr", "<cmd>GrugFar<CR>", mode = { "n", "v" }, noremap = true, desc = "Search and replace with Grug Far" },
	},
}
