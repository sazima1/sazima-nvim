--[[
Name: Neogen
Language: N/A
Description: Generate docstrings
--]]
return {
	"danymat/neogen",
	opts = {},
	keys = {
		{
			"<leader>ydf",
			function()
				require("neogen").generate({ type = "func" })
			end,
			mode = { "n" },
			desc = "Add Docstring/Annotation for current function",
		},
		{
			"<leader>ydc",
			function()
				require("neogen").generate({ type = "class" })
			end,
			mode = { "n" },
			desc = "Add Docstring/Annotation for current class",
		},
		{
			"<leader>ydt",
			function()
				require("neogen").generate({ type = "type" })
			end,
			mode = { "n" },
			desc = "Add Docstring/Annotation for current type",
		},
		{
			"<leader>yde",
			function()
				require("neogen").generate({ type = "file" })
			end,
			mode = { "n" },
			desc = "Add Docstring/Annotation for current file",
		},
	},
}
