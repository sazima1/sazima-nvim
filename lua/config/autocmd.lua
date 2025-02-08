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
-- local groupRemoveWhiteSpace = augroup("groupRemoveWhiteSpace", {})
-- autocmd({ "BufWritePre" }, {
-- 	group = groupRemoveWhiteSpace,
-- 	pattern = "*",
-- 	callback = function()
-- 		local save_cursor = vim.fn.getpos(".")
-- 		pcall(function()
-- 			vim.cmd([[%s/\s\+$//e]])
-- 		end)
-- 		vim.fn.setpos(".", save_cursor)
-- 	end,
-- })

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
	pattern = { "*.assembly*", "*.subassembly*", "*.diablo*", "*.dbl*" },
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
		require("lint").try_lint()

		-- This is a previous autocmd sorta stolen but not well implemented that slows everything
		-- down. Had to comment it out. Maybe can reimplement some day.
		-- local M = {}
		-- -- Prevents linting all the time (stolen from LazyVim)
		-- function M.debounce(ms, fn)
		-- 	local timer = vim.uv.new_timer()
		-- 	return function(...)
		-- 		local argv = { ... }
		-- 		timer:start(ms, 0, function()
		-- 			timer:stop()
		-- 			vim.schedule_wrap(fn)(unpack(argv))
		-- 		end)
		-- 	end
		-- end
		-- -- Lints
		-- function M.lint(ms)
		-- 	M.debounce(ms, require("lint").try_lint())
		-- end
		-- -- Run the modified linting operation every N milliseconds
		-- M.lint(100)
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

-- Disable automatic commenting of next line
local groupComments = augroup("groupComments", {})
autocmd("FileType", {
	pattern = "*",
	group = groupComments,
	callback = function()
		vim.opt.formatoptions:append({ "c" })
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
	desc = "Disable New Line Comment",
})
