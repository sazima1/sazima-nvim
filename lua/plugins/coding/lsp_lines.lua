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
		{ "<leader>xf", "<Cmd>lua vim.diagnostic.open_float()<CR>", mode = { "n" }, desc = "Show floating diagnostic window for current diagnostic(s) under the cursor" },
	},
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
		})

		-- Initialize as off for less clutter when opening a file
		vim.diagnostic.config({ virtual_lines = false })
	end,
}
