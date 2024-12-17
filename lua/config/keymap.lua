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

-- Tab management - Like Tmux
-- map("n", "<C-s>c", "<Cmd>$tabnew<CR>")
-- map("n", "<C-s>d", "<Cmd>tabclose<CR>")
-- map("n", "<C-s>n", "gt")
-- map("n", "<C-s>p", "gT")
-- map("n", "<C-s>l", "<Cmd>tabs<CR>")
-- map("n", "<C-s>1", "1gt")
-- map("n", "<C-s>2", "2gt")
-- map("n", "<C-s>3", "3gt")
-- map("n", "<C-s>4", "4gt")
-- map("n", "<C-s>5", "5gt")
-- map("n", "<C-s>6", "6gt")
-- map("n", "<C-s>7", "7gt")
-- map("n", "<C-s>8", "8gt")
-- map("n", "<C-s>9", "9gt")
-- map("t", "<C-s>c", "<C-\\><C-n><Cmd>$tabnew<CR>")
-- map("t", "<C-s>d", "<C-\\><C-n><Cmd>tabclose<CR>")
-- map("t", "<C-s>n", "<C-\\><C-n>gt")
-- map("t", "<C-s>p", "<C-\\><C-n>gT")
-- map("t", "<C-s>l", "<C-\\><C-n><Cmd>tabs<CR>")
-- map("t", "<C-s>1", "<C-\\><C-n>1gt")
-- map("t", "<C-s>2", "<C-\\><C-n>2gt")
-- map("t", "<C-s>3", "<C-\\><C-n>3gt")
-- map("t", "<C-s>4", "<C-\\><C-n>4gt")
-- map("t", "<C-s>5", "<C-\\><C-n>5gt")
-- map("t", "<C-s>6", "<C-\\><C-n>6gt")
-- map("t", "<C-s>7", "<C-\\><C-n>7gt")
-- map("t", "<C-s>8", "<C-\\><C-n>8gt")
-- map("t", "<C-s>9", "<C-\\><C-n>9gt")
--
-- Easier window resizing
map("n", "=", "<cmd>vertical resize +5<CR>", { desc = "Make window larger vertically" })
map("n", "-", "<cmd>vertical resize -5<CR>", { desc = "Make window smaller vertically" })
map("n", "+", "<cmd>horizontal resize +5<CR>", { desc = "Make window larger horizontally" })
map("n", "_", "<cmd>horizontal resize -5<CR>", { desc = "Make window smaller horizontally" })

-- Improve half-page up and down
map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Half page up also recenters text" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Half page down also recenters text" })

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

-- -- THESE MAPS MAKE TMUX WINDOWS CRASH WITH CLIPBOARD ON. JUST USE TMUX COPYING WITH `prefix + y`
-- map({ "n", "v" }, "<leader>y", '"+y', { noremap = true, desc = "Yank to clipboard" })
-- map({ "n", "v" }, "<leader>p", '"+p', { noremap = true, desc = "Paste from clipboard" })
