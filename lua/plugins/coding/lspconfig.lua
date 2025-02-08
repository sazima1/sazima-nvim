return {
	"neovim/nvim-lspconfig",
	-- enabled = false,
	dependencies = {
		-- "williamboman/mason.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
		"ray-x/lsp_signature.nvim",
	},
	opts = function()
		local opts = {
			servers = {
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = {
								useLibraryCodeForTypes = true,
								autoSearchPaths = true,
								disableOrganizeImports = true,
								autoImportCompletions = true,
								diagnosticMode = "openFilesOnly",
							},
						},
					},
					on_attach = function(client, _)
						local csc = client.server_capabilities
						--                   csc.hoverProvider = false
						-- csc.signatureHelpProvider = false
						-- csc.definitionProvider = false
					end,
				},
				bashls = {
					settings = {
						bashIde = {
							shellcheckPath = "", -- Disable shellcheck in bash-language-server. It conflicts with linter settings.
						},
					},
				},
				harper_ls = {
					settings = {
						["harper-ls"] = {
							linters = {
								sentence_capitalization = false,
								long_sentences = false,
							},
						},
					},
					filetypes = { "latex", "plaintex", "tex", "text" },
				},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "Lua 5.4" },
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				markdown_oxide = {},
				marksman = {},
				matlab_ls = {},
				perlnavigator = {},
				ruff = {
					on_attach = function(client, _)
						local csc = client.server_capabilities
						csc.hoverProvider = false
					end,
				},
				texlab = {
					cmd = { os.getenv("HOME") .. "/bin/texlab" },
				},
				yamlls = {},
				vale_ls = {
					cmd = { os.getenv("HOME") .. "/bin/vale-ls" },
					filetypes = { "latex", "plaintex", "tex", "text" },
				},
			},
		}
		return opts
	end,
	config = function(_, opts)
		local lsp = require("lspconfig")

		-- Give all servers nvim-cmp capabilities
		-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Tell the server the capability of foldingRange, Neovim hasn't added foldingRange to default capabilities, users must add it manually
		-- lsp_capabilities.textDocument.foldingRange = {
		-- 	dynamicRegistration = false,
		-- 	lineFoldingOnly = true,
		-- }

		-- -- Settings for LSP attach
		-- local on_attach = function(client, _)
		-- 	local server_capabilities = client.server_capabilities
		--
		-- 	if client.name == "basedpyright" then
		-- 		server_capabilities.hoverProvider = false
		-- 		server_capabilities.signatureHelpProvider = false
		-- 		server_capabilities.definitionProvider = false
		-- 	end
		-- 	if client.name == "ruff" then
		-- 		client.server_capabilities.hoverProvider = false
		-- 	end
		-- end

		-- Set up all LSPs
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			config.capabilities.textDocument.foldingRange = { -- Tell the server the capability of foldingRange, Neovim hasn't added foldingRange to default capabilities, users must add it manually
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			lsp[server].setup(config)
		end

		-- --Commands
		-- local augroup = vim.api.nvim_create_augroup
		-- local autocmd = vim.api.nvim_create_autocmd
		-- local groupLspAttach = augroup("lsp_attach_disable_ruff_hover", { clear = true })
		-- autocmd({ "LspAttach" }, {
		-- 	group = groupLspAttach,
		-- 	callback = function(args)
		-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- 		if client == nil then
		-- 			return
		-- 		end
		-- 		if client.name == "ruff" or client.name == "Ruff" then
		-- 			client.server_capabilities.hoverProvider = false
		-- 		end
		-- 	end,
		-- 	desc = "LSP: Disable hover capability from Ruff",
		-- })

		-- Command to create LSP server keymaps when they attach
		local lsp_cmds = vim.api.nvim_create_augroup("groupLspCmds", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = groupLspCmds,
			desc = "LSP actions",
			callback = function()
				local map = vim.keymap.set
				if vim.lsp.inlay_hint then
					map("n", "gi", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, { buffer = true, desc = "Toggle inlay hints" })
				end
                -- stylua: ignore start
				map("n", "gd", function() vim.lsp.buf.definition() end, { buffer = true, desc = "Go to definition" })
				map("n", "gD", function() vim.lsp.buf.declaration() end, { buffer = true, desc = "Go to declaration" })
				map("n", "gm", function() vim.lsp.buf.implementation() end, { buffer = true, desc = "Go to implementation" })
				map("n", "go", function() vim.lsp.buf.type_definition() end, { buffer = true, desc = "Go to type definition" })
				map("n", "gr", function() vim.lsp.buf.references() end, { buffer = true, desc = "Show references" })

				map("n", "gs", function() vim.lsp.buf.signature_help() end, { buffer = true, desc = "Show signature help" })
				map("n", "gh", function() vim.lsp.buf.hover() end, { buffer = true, desc = "Open LSP hover help" })
				map("i", "<C-space>", function() vim.lsp.buf.signature_help() end, { buffer = true, desc = "Show signature help" })

				map("n", "gl", function() vim.diagnostic.open_float() end, { buffer = true, desc = "Open float" })
				map("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = true, desc = "Go to previous diagnostic" })
				map("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = true, desc = "Go to next diagnostic" })

				map("n", "<F2>", function() vim.lsp.buf.rename() end, { buffer = true, desc = "Rename component under cursor" })
				map("n", "<F4>", function() vim.lsp.buf.code_action() end, { buffer = true, desc = "Run code action" })
				-- stylua: ignore end
			end,
		})
	end,
}
