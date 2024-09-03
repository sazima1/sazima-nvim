return {
	"echasnovski/mini.indentscope",
	version = false,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Disable indentscope for certain filetypes",
			pattern = {
				"alpha",
				"dashboard",
				"fzf",
				"help",
				"lazy",
				"lazyterm",
				"mason",
				"neo-tree",
				"notify",
				"toggleterm",
				"Trouble",
				"trouble",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
	config = function()
		local mis = require("mini.indentscope")
		mis.setup({
			draw = {
				animation = mis.gen_animation.none(),
				delay = 0,
			},
		})
	end,
}
