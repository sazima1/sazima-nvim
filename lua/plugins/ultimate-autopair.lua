--[[
Name: Ultimate Autopair
Language: N/A
Description: Autopairs and fastwarp
Notes:
  - Initially tried replacing with Clasp and Mini.Pairs, but it just didn't work as well
--]]
return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = "v0.6", --recommended as each new version will have breaking changes
	opts = {
		-- tabout = {
		-- 	enable = true,
		-- 	hopout = true,
		-- 	map = "<C-l>",
		-- 	cmap = "<C-l>",
		-- },
		fastwarp = {
			map = "<C-Right>",
			rmap = "<C-Left>",
			cmap = "<C-Right>",
			rcmap = "<C-Left>",
		},
		extensions = {
			cond = {
				cond = function(fn) return not fn.in_macro() end,
			},
		},
	},
}
