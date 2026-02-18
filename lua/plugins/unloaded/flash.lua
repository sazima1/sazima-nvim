--[[
Name: Flash
Language: N/A
Description: Easy in-buffer navigation using letter pairs and virtual text
--]]
return {
	"folke/flash.nvim",
	lazy = false,
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump({ remote_op = { restore = true, motion = nil } }) end, desc = "Flash" },
		{ "SP", mode = { "n" }, function() require("flash").treesitter({ jump = { pos = "start" }, label = { before = true, after = false } }) end, desc = "Flash Treesitter" },
		{ "SN", mode = { "n" }, function() require("flash").treesitter({ jump = { pos = "end" }, label = { before = false, after = true } }) end, desc = "Flash Treesitter" },
		{ "SS", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
	opts = {
		jump = {
			autojump = true,
		},
		modes = {
			char = {
				enabled = true,
				multi_line = false,
				highlight = { backdrop = false },
			},
		},
	},
	specs = {
		{
			"folke/snacks.nvim",
			opts = {
				picker = {
					win = {
						input = {
							keys = {
								["<a-s>"] = { "flash", mode = { "n", "i" } },
								["s"] = { "flash" },
							},
						},
					},
					actions = {
						flash = function(picker)
							require("flash").jump({
								pattern = "^",
								label = { after = { 0, 0 } },
								search = {
									mode = "search",
									exclude = {
										function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list" end,
									},
								},
								action = function(match)
									local idx = picker.list:row2idx(match.pos[1])
									picker.list:_move(idx, true, true)
								end,
							})
						end,
					},
				},
			},
		},
	},
}
