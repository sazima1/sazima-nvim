return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"ray-x/lsp_signature.nvim",
	},
	config = function()
		local lsp = require("lspconfig")

		-- Give all servers nvim-cmp capabilities
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Tell the server the capability of foldingRange, Neovim hasn't added foldingRange to default capabilities, users must add it manually
		lsp_capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Settings for LSP attach
		local on_attach = function(client, _)
			local server_capabilities = client.server_capabilities

			if client.name == "basedpyright" then
				server_capabilities.hoverProvider = false
				server_capabilities.signatureHelpProvider = false
				server_capabilities.definitionProvider = false
			end
		end
		local servers = {
			"basedpyright",
			"bashls",
			"harper_ls",
			"lua_ls",
			"markdown_oxide",
			"marksman",
			"matlab_ls",
			"perlnavigator",
			"ruff",
			"texlab",
			"yamlls",
			"vale_ls",
		}

		-- Default give all servers completion and folding capabilities
		for _, server in ipairs(servers) do
			lsp[server].setup({
				capabilities = lsp_capabilities,
				on_attach = on_attach,
			})
		end

		-- Set up each server's settings
		lsp.lua_ls.setup({
			settings = {
				Lua = {
					runtime = { version = "Lua 5.4" },
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		lsp.bashls.setup({
			settings = {
				bashIde = {
					-- Disable shellcheck in bash-language-server. It conflicts with linter settings.
					shellcheckPath = "",
				},
			},
		})
		lsp.basedpyright.setup({
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
		})
		lsp.harper_ls.setup({
			settings = {
				["harper-ls"] = {
					linters = {
						sentence_capitalization = false,
						long_sentences = false,
					},
				},
			},
		})
		lsp.vale_ls.setup({
			cmd = { os.getenv("HOME") .. "/bin/vale-ls" },
		})
		lsp.texlab.setup({
			cmd = { os.getenv("HOME") .. "/bin/texlab" },
		})

		--Commands
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		local groupLspAttach = augroup("lsp_attach_disable_ruff_hover", { clear = true })
		autocmd({ "LspAttach" }, {
			group = groupLspAttach,
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then
					return
				end
				if client.name == "ruff" or client.name == "Ruff" then
					client.server_capabilities.hoverProvider = false
				end
			end,
			desc = "LSP: Disable hover capability from Ruff",
		})

		-- Command to create lsp server
		local lsp_cmds = vim.api.nvim_create_augroup("lsp_cmds", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = lsp_cmds,
			desc = "LSP actions",
			callback = function()
				local map = vim.keymap.set
				if vim.lsp.inlay_hint then
					map("n", "gi", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", { buffer = true, desc = "Toggle inlay hints" })
				end
				map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = true, desc = "Go to definition" })
				map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = true, desc = "Go to declaration" })
				map("n", "gm", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = true, desc = "Go to implementation" })
				map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = true, desc = "Go to type definition" })
				map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = true, desc = "Show references" })

				map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = true, desc = "Show signature help" })
				map("n", "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = true, desc = "Open LSP hover help" })
				map("i", "<C-space>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = true, desc = "Show signature help" })

				map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = true, desc = "Open float" })
				map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { buffer = true, desc = "Go to previous diagnostic" })
				map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { buffer = true, desc = "Go to next diagnostic" })

				map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = true, desc = "Rename component under cursor" })
				map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = true, desc = "Run code action" })
			end,
		})
	end,
}
