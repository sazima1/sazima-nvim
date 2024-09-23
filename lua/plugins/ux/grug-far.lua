return {
	"MagicDuck/grug-far.nvim",
	-- opts = { headerMaxWidth = 30 },
	-- cmd = "GrugFar",
	-- keys = {
	-- 	{
	-- 		"<leader>sr",
	-- 		function()
	-- 			local grug = require("grug-far")
	-- 			local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
	-- 			grug.open({
	-- 				transient = true,
	-- 				prefills = {
	-- 					filesFilter = ext and ext ~= "" and "*." .. ext or nil,
	-- 				},
	-- 			})
	-- 		end,
	-- 		mode = { "n", "v" },
	-- 		desc = "Search and Replace",
	-- 	},
	-- },
	config = function()
		require("grug-far").setup({})

		-- Keymaps
		local map = vim.keymap.set

		map(
			{ "n", "v" },
			"<leader>sr",
			"<cmd>GrugFar<CR>",
			{ noremap = true, desc = "Search and replace with Grug Far" }
		)
	end,
}
