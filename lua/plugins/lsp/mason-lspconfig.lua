return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason-lspconfig").setup({
			handlers = {
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = lsp_capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.4" },
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
				["bashls"] = function()
					lspconfig.bashls.setup({
						settings = {
							bashIde = {
								-- Disable shellcheck in bash-language-server. It conflicts with linter settings.
								shellcheckPath = "",
							},
						},
						capabilities = lsp_capabilities,
					})
				end,
				-- ["pyright"] = function()
				-- 	lspconfig.pyright.setup({
				-- 		capabilities = lsp_capabilities,
				-- 	})
				-- end,
				["basedpyright"] = function()
					lspconfig.basedpyright.setup({
						capabilities = lsp_capabilities,
						settings = {
							basedpyright = {
								analysis = {
									autoSearchPaths = true,
									disableOrganizeImports = true,
									autoImportCompletions = true,
									diagnosticMode = "openFilesOnly",
								},
							},
						},
					})
				end,
				["ruff"] = function()
					lspconfig.ruff.setup({
						init_options = {
							settings = {
								showSyntaxErrors = true,
								fixViolation = {
									enable = false,
								},
								lineLength = 100,
							},
						},
					})
				end,
				function(server)
					lspconfig[server].setup({
						capabilities = lsp_capabilities,
					})
				end,
			},
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
	end,
}
