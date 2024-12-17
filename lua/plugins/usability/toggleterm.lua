return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			open_mapping = [[<C-\>]],
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.25
				end
			end,
			direction = "vertical",
		})

		-- Keymaps
		local map = vim.keymap.set

		-- Open terminal based on direction
		map("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>")
		map("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>")
		map("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>")

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			local termmap = vim.keymap.set
			termmap("t", "<C-space>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
			termmap("t", "<esc>", [[<C-\><C-n>]], opts)
			-- termmap("t", "jk", [[<C-\><C-n>]], opts)
			termmap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			termmap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			termmap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			termmap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			termmap("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- If you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- -- Lazygit
		-- local Terminal = require("toggleterm.terminal").Terminal
		-- local Lazygit = Terminal:new({ cmd = "Lazygit", direction = "float", hidden = true })
		--
		-- function _Lazygit_toggle()
		-- 	Lazygit:toggle()
		-- end
		--
		-- vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })
	end,
}
