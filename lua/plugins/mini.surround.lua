--[[
Name: Mini.Surround
Language: N/A
Description: Surround words/selection with what you specify. Also delete, replace, and more
--]]
return {
	"echasnovski/mini.surround",
	version = false,
	event = "VeryLazy",
	opts = {
		mappings = {
			add = "ra", -- Add surrounding in Normal and Visual modes
			delete = "rd", -- Delete surrounding
			find = "rf", -- Find surrounding (to the right)
			find_left = "rF", -- Find surrounding (to the left)
			highlight = "rh", -- Highlight surrounding
			replace = "rr", -- Replace surrounding
			update_n_lines = "rn", -- Update `n_lines`
		},
	},
}
