local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local set = vim.opt
local set_local = vim.opt_local

-- Highlight what you yanked
local group_highlight = augroup("group_highlight", {})
autocmd({ "TextYankPost" }, {
	group = group_highlight,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Set filetype for various AEAG groups (and bash)
local group_set_syntax = augroup("group_set_syntax", {})
autocmd({ "BufNewFile", "BufRead" }, {
	group = group_set_syntax,
	pattern = { "*.tg", "*.part", "*.lc", "*.mtrl", "*.key", "*.ig", "trugrdi" },
	callback = function() set.filetype = "ingrid" end,
})
autocmd({ "BufNewFile", "BufRead" }, {
	group = group_set_syntax,
	pattern = { "*.assembly*", "*.subassembly*", "*.diablo*", "*.dbl*" },
	callback = function() set.filetype = "diablo" end,
})
autocmd({ "BufNewFile", "BufRead" }, {
	group = group_set_syntax,
	pattern = { "*.bash*" },
	callback = function() set.filetype = "sh" end,
})

-- Turn on word wrap for word processing file extensions
local group_word_wrap = augroup("group_word_wrap", {})
autocmd({ "BufNewFile", "BufRead" }, {
	group = group_word_wrap,
	pattern = { "*.tex", "*.latex", "*.md", "*.txt", "*.text" },
	callback = function() set_local.wrap = true end,
})

-- Format on save
local group_formatting = augroup("group_formatting", {})
autocmd({ "BufWritePre" }, {
	group = group_formatting,
	pattern = "*",
	callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})
-- Remove whitespace when files are saved
-- autocmd({ "BufWritePre" }, {
-- 	group = group_formatting,
-- 	pattern = "*",
-- 	callback = function()
-- 		local save_cursor = vim.fn.getpos(".")
-- 		pcall(function()
-- 			vim.cmd([[%s/\s\+$//e]])
-- 		end)
-- 		vim.fn.setpos(".", save_cursor)
-- 	end,
-- })

-- Disable the gutter for terminals
local group_terminal = augroup("group_terminal", {})
autocmd({ "TermOpen" }, {
	group = group_terminal,
	pattern = "*",
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
		vim.wo.signcolumn = "no"
	end,
	desc = "Disable gutter in terminal",
})

-- Enable linting
local group_linting = augroup("group_linting", { clear = true })
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = group_linting,
	callback = function() require("lint").try_lint() end,
})

-- Disable automatic commenting of next line
local group_comments = augroup("group_comments", {})
autocmd("FileType", {
	pattern = "*",
	group = group_comments,
	callback = function()
		vim.opt.formatoptions:append({ "c" })
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
	desc = "Disable New Line Comment",
})

-- Put help windows into a right vertical buffer
local group_help = augroup("group_help", {})
autocmd("FileType", {
	group = group_help,
	pattern = "help",
	callback = function() vim.cmd("wincmd L | let w = min([90, &columns / 2]) | execute 'vertical resize ' . w") end,
})
-- autocmd("BufEnter", {
-- 	group = group_help,
-- 	callback = function(args)
-- 		local bufnr = args.buf
-- 		local filetype = vim.bo[bufnr].filetype
-- 		-- local help_fts = {
-- 		-- 	"help",
-- 		-- 	"helpmd",
-- 		-- }
-- 		local enew_fts = {
-- 			"snacks_dashboard",
-- 		}
--
-- 		-- for _, ft in ipairs(enew_fts) do
-- 		-- 	if filetype == b then
-- 		-- 	end
-- 		-- end
-- 		-- If in dashboard, open an empty buffer to prevent errors
-- 		for _, b in ipairs(enew_fts) do
-- 			if filetype == b then
-- 				vim.cmd.enew()
-- 			end
-- 		end
-- 		vim.cmd("wincmd L | let w = min([90, &columns / 2]) | execute 'vertical resize ' . w")
-- 	end,
-- })

-- Automatically create directory for file if it doesn't exist
local group_auto_create_dir = augroup("group_auto_create_dir", { clear = true })
autocmd("BufWritePre", {
	desc = "Autocreate a dir when saving a file",
	group = group_auto_create_dir,
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Never accidentally open the CmdWin (q:) ever again. Just use the snacks picker for it "<leader>sc"
local group_cancel_cmdwin = augroup("group_cancel_cmdwin", { clear = true })
autocmd("CmdWinEnter", {
	desc = "Quits the CmdWin when it's entered",
	pattern = "*",
	group = group_cancel_cmdwin,
	command = "quit",
})

-- Use "q" to close special buffer types. '' catches a lot of transient plugin windows.
local group_close_on_q = augroup("group_close_on_q", { clear = true })
autocmd({ "BufEnter" }, {
	group = group_close_on_q,
	callback = function(args)
		local bufnr = args.buf
		local filetype = vim.bo[bufnr].filetype
		local simple_close_types = {
			"",
			"checkhealth",
			"dap-scopes",
			"dap-view",
			"dap-view-term",
			"fugitive",
			"fugitiveblame",
			"git",
			"help",
			"lazy",
			"man",
			"qf",
			"startuptime",
			"tags",
			-- "vim", -- Is this needed?
		}
		local tab_close_types = {
			"DiffviewFiles",
			"DiffviewFileHistory",
		}
		-- local num_listed = #vim.tbl_filter(function(bufnr) return vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) end, vim.api.nvim_list_bufs())
		for _, b in ipairs(simple_close_types) do
			if filetype == b then
				vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "", {
					callback = function() vim.api.nvim_command("bdelete") end,
				})
			end
		end
		for _, b in ipairs(tab_close_types) do
			if filetype == b then
				vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "", {
					callback = function() vim.api.nvim_command("tabclose") end,
				})
			end
		end
	end,
})

-- resize splits if the terminal window is resized
-- autocmd("VimResized", {
-- 	command = "wincmd =",
-- })

-- This isn't working at the moment
-- Automatically close Neovim if the only buffer open has a certain filetype
-- local close_with_remaining_ft = augroup("close_with_remaining_ft", { clear = true })
-- autocmd({ "BufDelete" }, {
-- 	group = close_with_remaining_ft,
-- 	callback = function(args)
-- 		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
-- 		print(#buffers)
-- 		if #buffers ~= 1 then
-- 			print("this occurred")
-- 			return
-- 		end
--
-- 		local bufnr = args.buf
-- 		local filetype = vim.bo[bufnr].filetype
-- 		local simple_close_types = {
-- 			"snacks_picker_list",
-- 		}
-- 		-- local num_listed = #vim.tbl_filter(function(bufnr) return vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) end, vim.api.nvim_list_bufs())
-- 		for _, b in ipairs(simple_close_types) do
-- 			if filetype == b then
-- 				print("matched ft")
-- 				vim.api.nvim_command("q")
-- 			end
-- 		end
-- 	end,
-- })
