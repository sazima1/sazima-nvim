return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = "open_default",
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
			window = {
				width = 50,
			},
		})

		-- Keymaps
		local map = vim.keymap.set

		map("n", "<leader>fe", "<cmd>Neotree<CR>", { noremap = true, desc = "Toggle Neotree" })
		map("n", "<leader>te", "<cmd>Neotree toggle<CR>", { noremap = true, desc = "Toggle Neotree" })
	end,
}
