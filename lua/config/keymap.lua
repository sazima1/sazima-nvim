local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = "\\"

map("i", "jk", "<Esc>", { desc = "Escape from insert mode with 'jk' pressed in succession" })

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left without the extra <C-w> press" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down without the extra <C-w> press" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up without the extra <C-w> press" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right without the extra <C-w> press" })

map("n", "=", "<cmd>vertical resize +5<CR>", { desc = "Make window larger vertically" })
map("n", "-", "<cmd>vertical resize -5<CR>", { desc = "Make window smaller vertically" })
map("n", "+", "<cmd>horizontal resize +5<CR>", { desc = "Make window larger horizontally" })
map("n", "_", "<cmd>horizontal resize -5<CR>", { desc = "Make window smaller horizontally" })

map("t", "<C-space>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Half page up also recenters text" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Half page down also recenters text" })

map("", "<F3>", "<cmd>e <cfile><CR>", { noremap = true, desc = "Open file under the cursor" })

map("n", "Q", "@q", { noremap = true, desc = "Quick macro activation for temporary macros (stored in register q)" })

map("n", "<leader>a", "za", { noremap = true, desc = "Easier fold toggle combo" })
map("n", "<leader>A", "zA", { noremap = true, desc = "Easier fold toggle combo" })

map("n", "<C-n>", "<cmd>nohl<CR>")

map({ "n", "v" }, "<leader>y", '"+y', { noremap = true, desc = "Yank to clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { noremap = true, desc = "Paste from clipboard" })
