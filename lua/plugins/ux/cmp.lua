return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- creating a custom comparator for cmp menu
		local lspkind_comparator = function(conf)
			local lsp_types = require("cmp.types").lsp
			return function(entry1, entry2)
				if entry1.source.name ~= "nvim_lsp" then
					if entry2.source.name == "nvim_lsp" then
						return false
					else
						return nil
					end
				end
				local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
				local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
				if kind1 == "Variable" and entry1:get_completion_item().label:match("%w*=") then
					kind1 = "Parameter"
				end
				if kind2 == "Variable" and entry2:get_completion_item().label:match("%w*=") then
					kind2 = "Parameter"
				end

				local priority1 = conf.kind_priority[kind1] or 0
				local priority2 = conf.kind_priority[kind2] or 0
				if priority1 == priority2 then
					return nil
				end
				return priority2 < priority1
			end
		end

		local label_comparator = function(entry1, entry2)
			return entry1.completion_item.label < entry2.completion_item.label
		end

		-- cmp setup (autocomplete)
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),
			-- window = {
			--     completion = cmp.config.window.bordered(),
			--     -- documentation = cmp.config.window.bordered(),
			-- },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sorting = {
				comparators = {
					lspkind_comparator({
						kind_priority = {
							Parameter = 14,
							Variable = 12,
							Field = 11,
							Property = 11,
							Constant = 10,
							Enum = 10,
							EnumMember = 10,
							Event = 10,
							Function = 10,
							Method = 10,
							Operator = 10,
							Reference = 10,
							Struct = 10,
							File = 8,
							Folder = 8,
							Class = 5,
							Color = 5,
							Module = 5,
							Keyword = 2,
							Constructor = 1,
							Interface = 1,
							Snippet = 0,
							Text = 1,
							TypeParameter = 1,
							Unit = 1,
							Value = 1,
						},
					}),
					label_comparator,
				},
			},
		})

		-- cmp `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- cmp `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}
