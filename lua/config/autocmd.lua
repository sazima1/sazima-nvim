local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local set = vim.opt

-- Highlight what you yanked
local groupHighlightYank = augroup("groupHighlightYank", {})
autocmd({ "TextYankPost" }, {
	group = groupHighlightYank,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Remove whitespace when files are saved
local groupRemoveWhiteSpace = augroup("groupRemoveWhiteSpace", {})
autocmd({ "BufWritePre" }, {
	group = groupRemoveWhiteSpace,
	pattern = "*",
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Set filetype for various AEAG groups (and bash)
local groupSetSyntax = augroup("groupSetSyntax", {})
autocmd({ "BufNewFile", "BufRead" }, {
	group = groupSetSyntax,
	pattern = { "*.tg", "*.part", "*.lc", "*.mtrl", "*.key", "*.ig", "trugrdi" },
	callback = function()
		set.filetype = "ingrid"
	end,
})
autocmd({ "BufNewFile", "BufRead" }, {
	group = groupSetSyntax,
	pattern = { "*.assembly*", "*.subassembly*" },
	callback = function()
		set.filetype = "diablo"
	end,
})
autocmd({ "BufNewFile", "BufRead" }, {
	group = groupSetSyntax,
	pattern = { "*.bash*" },
	callback = function()
		set.filetype = "bash"
	end,
})

-- Format on save
local groupFormatOnSave = augroup("groupFormatOnSave", {})
autocmd({ "BufWritePre" }, {
	group = groupFormatOnSave,
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Disable the gutter for terminals
local groupTermOpen = augroup("TermOpen", {})
autocmd({ "TermOpen" }, {
	group = groupTermOpen,
	pattern = "*",
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
		vim.wo.signcolumn = "no"
	end,
	desc = "Disable gutter in terminal",
})

-- Enable linting
local groupLinting = augroup("groupLinting", { clear = true })
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = groupLinting,
	callback = function()
		local M = {}
		-- Prevents linting all the time (stolen from LazyVim)
		function M.debounce(ms, fn)
			local timer = vim.uv.new_timer()
			return function(...)
				local argv = { ... }
				timer:start(ms, 0, function()
					timer:stop()
					vim.schedule_wrap(fn)(unpack(argv))
				end)
			end
		end
		-- Lints
		function M.lint(ms)
			M.debounce(ms, require("lint").try_lint())
		end
		-- Run the modified linting operation every N milliseconds
		M.lint(100)
	end,
})

-- Disable ufo folding for certain buffer types
local groupUfo = augroup("groupUfo", {})
autocmd({ "FileType" }, {
	group = groupUfo,
	pattern = { "neo-tree", "snacks_dashboard", "dashboard", "NeogitStatus" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
	end,
})

-- -- Toggle term mappings
-- function set_terminal_keymaps()
-- 	local opts = { buffer = 0 }
-- 	local termmap = vim.keymap.set
-- 	termmap("t", "<C-space>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- 	termmap("t", "<esc>", [[<C-\><C-n>]], opts)
-- 	-- termmap("t", "jk", [[<C-\><C-n>]], opts)
-- 	termmap("ckt", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- 	termmap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- 	termmap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- 	termmap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
-- 	termmap("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
-- end
-- vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
