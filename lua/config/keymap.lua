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

-- -- Profiling
-- map("n", "<leader><leader>ps", function()
-- 	vim.cmd([[
-- 		:profile start /tmp/nvim-profile.log
-- 		:profile func *
-- 		:profile file *
-- 	]])
-- end, { desc = "Profile Start" })
--
-- map("n", "<leader><leader>pe", function()
-- 	vim.cmd([[
-- 		:profile stop
-- 		:e /tmp/nvim-profile.log
-- 	]])
-- end, { desc = "Profile Stop" })
--
-- map("n", "<leader><leader>pc", function()
-- 	vim.cmd([[
-- 		:profile continue
-- 		:e /tmp/nvim-profile.log
-- 	]])
-- end, { desc = "Profile Continue" })
--
-- map("n", "<leader><leader>pp", function()
-- 	vim.cmd([[
-- 		:profile pause
-- 		:e /tmp/nvim-profile.log
-- 	]])
-- end, { desc = "Profile Pause" })

-- Copy-Paste
map({ "n", "v" }, "<leader><leader>y", '"*y', { noremap = true, desc = "Copy to the system clipboard" })
map({ "n", "v" }, "<leader><leader>p", '"*p', { noremap = true, desc = "Paste from the system clipboard" })
