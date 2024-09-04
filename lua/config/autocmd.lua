local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local set = vim.opt

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

local groupSetSyntax = augroup("groupSetSyntax", {})
autocmd({ "BufNewFile", "BufRead" }, {
	group = groupSetSyntax,
	pattern = { "*.tg", "*.part", "*.lc", "*.mtrl", "*.key", "trugrdi" },
	callback = function()
		set.filetype = "ingrid"
	end,
})
autocmd({ "BufNewFile", "BufRead" }, {
	group = groupSetSyntax,
	pattern = { "*.assembly", "*.subassembly" },
	callback = function()
		set.filetype = "diablo"
	end,
})

local groupFormatOnSave = augroup("groupFormatOnSave", {})
autocmd({ "BufWritePre" }, {
	group = groupFormatOnSave,
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

local groupLspAttach = augroup("lsp_attach_disable_ruff_hover", { clear = true })
autocmd({ "LspAttach" }, {
	group = groupLspAttach,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "Ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})
