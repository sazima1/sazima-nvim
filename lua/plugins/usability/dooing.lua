return {
	"atiladefreitas/dooing",
	keys = {
		{ "<leader><leader>t", "<Cmd>Dooing<CR>", mode = { "n" }, desc = "Show to-do list" },
	},
	opts = {
		keymaps = {
			toggle_window = "<leader><leader>t",
		},
	},
}
