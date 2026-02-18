local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end

-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
	map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = false, desc = "Open the link under the caret" })
	map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", { noremap = true, silent = false, desc = "Open notes linking to the current buffer" })
	map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", { noremap = true, silent = false, desc = "Open notes linked by the current buffer" })
	map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = false, desc = "Open the code actions for a visual selection" })
end

local set = vim.opt
local setlocal = vim.opt_local

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

setlocal.spell = true
