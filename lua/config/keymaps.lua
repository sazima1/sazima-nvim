local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = "\\"

-- Quick escape
map("i", "jk", "<Esc>", { desc = "Escape from insert mode with 'jk' pressed in succession" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left without the extra <C-w> press" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down without the extra <C-w> press" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up without the extra <C-w> press" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right without the extra <C-w> press" })

-- Easier window resizing
map("n", "=", "<cmd>vertical resize +5<CR>", { desc = "Make window larger vertically" })
map("n", "-", "<cmd>vertical resize -5<CR>", { desc = "Make window smaller vertically" })
map("n", "+", "<cmd>horizontal resize +5<CR>", { desc = "Make window larger horizontally" })
map("n", "_", "<cmd>horizontal resize -5<CR>", { desc = "Make window smaller horizontally" })

-- Improve half-page up and down
map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Half page up and recenter text", buffer = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Half page down and recenter text", buffer = true })

-- Improve next and previous jump list
map("n", "<C-o>", "<C-o>zz", { noremap = true, desc = "Previous jump list and recenter text" })
map("n", "<C-i>", "<C-i>zz", { noremap = true, desc = "Next jump list and recenter text" })

-- Open file under cursor
map("", "<F3>", "<cmd>e <cfile><CR>", { noremap = true, desc = "Open file under the cursor" })

-- Macros
map("n", "Q", "@q", { noremap = true, desc = "Quick macro activation for temporary macros (stored in register q)" })

-- Folding
map("n", "<leader>a", "za", { noremap = true, desc = "Easier fold toggle combo" })
map("n", "<leader>A", "zA", { noremap = true, desc = "Easier fold toggle combo" })

-- Highlighting
map("n", "<C-n>", "<cmd>nohl<CR>", { noremap = true, desc = "Turn off highlighting when shown" })

-- toggle wrapping
map("n", "<leader>w", function()
	vim.o.wrap = not vim.o.wrap
end, { noremap = true, desc = "Toggle word wrapping" })

-- Buffer control
map("n", "<leader>p", "<Cmd>b#<CR>", { noremap = true, desc = "Switch to the previously open buffer (cycle between 2 buffers)" })
map("n", "<leader>n", "<Cmd>bn<CR>", { noremap = true, desc = "Switch to the next buffer" })

-- Python
map("n", "<leader>yr", "<Cmd>!python3 %<CR>", { desc = "Run currently open Python file" })

-- Suspend
map("n", "<leader><leader>s", "<Cmd>suspend<CR>", { desc = "Suspend Neovim and bring up the parent terminal. Use command `fg` to resume the Neovim session." })

-- Remove Whitespace
map("n", "<leader>yw", function()
	local save_cursor = vim.fn.getpos(".")
	pcall(function()
		vim.cmd([[%s/\s\+$//e]])
	end)
	vim.fn.setpos(".", save_cursor)
end, { noremap = true, desc = "Remove extra whitespace from file" })

-- Copy-Paste
map({ "n", "v" }, "<leader><leader>y", '"*y', { noremap = true, desc = "Copy to the system clipboard" })
map({ "n", "v" }, "<leader><leader>p", '"*p', { noremap = true, desc = "Paste from the system clipboard" })

-- Diagnostics
map({ "n" }, "<leader>xl", function()
	-- because virtual_lines can be a boolean or a table, we need to check for the type and set the value accordingly
	if type(vim.diagnostic.config().virtual_lines) ~= "boolean" then
		vim.diagnostic.config({ virtual_lines = true })
	else
		local new_config = not vim.diagnostic.config().virtual_lines
		vim.diagnostic.config({ virtual_lines = new_config })
	end
end, { desc = "Toggle all inline diagnostics" })
map({ "n" }, "<leader>xo", function()
	-- because virtual_lines can be a boolean or a table, we need to check for the type and set the value accordingly
	if type(vim.diagnostic.config().virtual_lines) == "boolean" then
		vim.diagnostic.config({ virtual_lines = {
			current_line = true,
		} })
	else
		-- logic works better if we just fully set the virtual_lines entry to false, even if we are trying to set the current_line attribute
		local is_current_line = vim.diagnostic.config().virtual_lines.current_line
		if is_current_line then
			vim.diagnostic.config({ virtual_lines = false })
		else
			vim.diagnostic.config({ virtual_lines = {
				current_line = true,
			} })
		end
	end
end, { desc = "Toggle current line's inline diagnostics" })

-- Folding
vim.keymap.set("n", "<leader>M", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "<leader>R", "zR", { desc = "Open all folds" })
