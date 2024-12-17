return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = "v0.6", --recommended as each new version will have breaking changes
	opts = {
		tabout = {
			enable = true,
			hopout = true,
			map = "<C-l>",
			cmap = "<C-l>",
		},
		fastwarp = {
			map = "<C-Right>",
			rmap = "<C-Left>",
			cmap = "<C-Right>",
			rcmap = "<C-Left>",
		},
	},
}
