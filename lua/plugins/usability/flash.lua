return {
	"folke/flash.nvim",
    -- stylua: ignore start
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump({ remote_op = { restore = true, motion = nil } }) end, desc = "Flash" },
        { "SP", mode = { "n" }, function() require("flash").treesitter({jump = {pos = "start"}, label = { before = true, after = false }}) end, desc = "Flash Treesitter" },
        { "SN", mode = { "n" }, function() require("flash").treesitter({jump = {pos = "end"}, label = { before = false, after = true }}) end, desc = "Flash Treesitter" },
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
				enabled = false,
			},
		},
	},
}
