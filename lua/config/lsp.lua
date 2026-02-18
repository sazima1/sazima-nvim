--[[
Name: lsp
Language: N/A
Description: LSP configurations, diagnostic signs
Notes:
  - Configure LSP keymaps in here
--]]

-- Give all LSP servers default settings. These get MERGED by the files in '<config_root>/lsp' automatically (see lsp-config in help files)
vim.lsp.config("*", {
	root_markers = { ".git" },
	-- This capabilities part was shown in the docs. Not sure if it actually does anything...
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})

-- Automatically read names of all files in 'lsp' directory and enable their lsp
for _, server in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lsp")) do
	vim.lsp.enable(server:match("^(.*)%.lua$"))
end

-- Alter LSP capabilities on attach
local group_alter_capabilities = vim.api.nvim_create_augroup("group_alter_capabilities", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group_alter_capabilities,
	desc = "LSP capabilities",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "basedpyright" then
			-- client.server_capabilities.hoverProvider = false
			-- client.server_capabilities.documentSymbolProvider = false
		end
		if client.name == "jedi_language_server" then
			-- client.server_capabilities.hoverProvider = false
			client.server_capabilities.renameProvider = false
			client.server_capabilities.documentSymbolProvider = false
		end
		-- if client.name == "ruff" then
		-- 	client.server_capabilities.hoverProvider = false
		-- end
	end,
})

-- Set LSP keybindings only when LSP attaches
local group_lsp_cmds = vim.api.nvim_create_augroup("group_lsp_cmds", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group_lsp_cmds,
	desc = "LSP actions",
	callback = function(args)
		local map = vim.keymap.set
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/inlayHint") then
			map("n", "gi", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { buffer = true, desc = "Toggle inlay hints" })
		end
		map("n", "gd", function() Snacks.picker.lsp_definitions() end, { buffer = true, desc = "Go to definition" })
		map("n", "gD", function() Snacks.picker.lsp_declarations() end, { buffer = true, desc = "Go to declaration" })
		map("n", "gr", function() Snacks.picker.lsp_references() end, { buffer = true, desc = "Go to references" })
		map("n", "gI", function() Snacks.picker.lsp_implementations() end, { buffer = true, desc = "Go to implementation" })
		map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { buffer = true, desc = "Go to type definition" })
		map("n", "go", function() Snacks.picker.lsp_symbols() end, { buffer = true, desc = "Go to type definition" })
		map("n", "H", function() vim.lsp.buf.signature_help() end, { buffer = true, desc = "Show signature help" })
		map("n", "K", function() vim.lsp.buf.hover() end, { buffer = true, desc = "Open LSP hover help" })
		map("i", "<C-h>", function() vim.lsp.buf.hover() end, { buffer = true, desc = "Open LSP hover help" })
		map("n", "<F2>", function() vim.lsp.buf.rename() end, { buffer = true, desc = "Rename component under cursor" })
		map("n", "<F4>", function() vim.lsp.buf.code_action() end, { buffer = true, desc = "Run code action" })
	end,
})

-- Set diagnostic signs
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
	float = {
		border = "rounded",
		format = function(d) return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code) end,
	},
	underline = true,
	jump = {
		float = true,
	},
})
