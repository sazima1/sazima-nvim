--[[
Name: Lsp Lines
Language: N/A
Description: Inline code diagnostics with virtual text
--]]
return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	opts = {},
	keys = {
		{
			"<leader>xl",
			function()
				require("lsp_lines").toggle()
			end,
			mode = { "n" },
			desc = "Toggle inline lsp diagnostics",
		},
	},
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
		})

		-- Initialize as off for less clutter when opening a file
		vim.diagnostic.config({ virtual_lines = false })
	end,
}
