--[[
Name: Aerial
Language: N/A
Description: Code outline and navigator
--]]
return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
		filter_kind = false,
		autojump = true,
		nav = {
			autojump = true,
		},
	},
	keys = {
		{ "<leader>la", "<cmd>AerialToggle! left<CR>", mode = { "n" }, desc = "Open code outline" },
		{ "<leader>ln", "<cmd>AerialNavToggle<CR>", mode = { "n" }, desc = "Open code outline navigator" },
	},
}
