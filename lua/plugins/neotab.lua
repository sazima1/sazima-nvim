--[[
Name: Neotab
Language: N/A
Description: Tabout functionality in Neovim
Notes:
  - Combined with mini.pairs for nice autopairs + tabout functionality
--]]
return {
	"kawre/neotab.nvim",
	event = "InsertEnter",
	opts = {
		tabkey = "<Tab>",
		act_as_tab = true,
		behavior = "nested",
		pairs = {
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "<", close = ">" },
		},
		exclude = {},
	},
}
