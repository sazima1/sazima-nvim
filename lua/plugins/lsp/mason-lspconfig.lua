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
				function(server)
					lspconfig[server].setup({
						capabilities = lsp_capabilities,
					})
				end,
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
								showSyntaxErrors = false,
								fixViolation = {
									enable = false,
								},
								lineLength = 100,
								format = {
									preview = true,
								},
							},
						},
					})
				end,
			},
		})
	end,
}
