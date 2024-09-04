local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = "\\"

map("i", "jk", "<Esc>", { desc = "escape from insert mode with 'jk' pressed in succession" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left without the extra <C-w> press" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down without the extra <C-w> press" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up without the extra <C-w> press" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right without the extra <C-w> press" })

map("n", "<leader>fe", "<cmd>Neotree<CR>", { noremap = true, desc = "Toggle Neotree" })
map("n", "<leader>te", "<cmd>Neotree toggle<CR>", { noremap = true, desc = "Toggle Neotree" })

local opts = { noremap = true, silent = true }
-- Normal-mode commands
map("n", "<C-down>", ":MoveLine(1)<CR>", opts)
map("n", "<C-up>", ":MoveLine(-1)<CR>", opts)

-- Visual-mode commands
map("v", "<C-down>", ":MoveBlock(1)<CR>", opts)
map("v", "<C-up>", ":MoveBlock(-1)<CR>", opts)

map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Half page up also recenters text" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Half page down also recenters text" })

map("", "<F3>", "<cmd>e <cfile><CR>", { noremap = true, desc = "Open file under the cursor" })

map("n", "Q", "@q", { noremap = true, desc = "Quick macro activation for temporary macros (stored in register q)" })

map("n", "<leader>a", "za", { noremap = true, desc = "Easier fold toggle combo" })
map("n", "<leader>A", "zA", { noremap = true, desc = "Easier fold toggle combo" })

map("n", "<C-n>", "<cmd>nohl<CR>")

map("n", "<leader>ge", "<cmd>Neogit<CR>", { noremap = true, desc = "Open Neogit" })
map("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { noremap = true, desc = "Open Diffview" })
map("n", "<leader>dvc", "<cmd>DiffviewClose<CR>", { noremap = true, desc = "Close Diffview" })
