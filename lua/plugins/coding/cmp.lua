return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"neovim/nvim-lspconfig",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"ray-x/lsp_signature.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local compare = require("cmp.config.compare")
		local luasnip = require("luasnip")
		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}

		-- cmp setup (autocomplete)
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}),
			mapping = cmp.mapping.preset.insert({
				-- ["<Tab>"] = cmp.mapping.complete(),
				-- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-g>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
				},
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sorting = {
				comparators = {
					compare.offset,
					compare.exact,
					compare.score,
					compare.recently_used,

					-- copied from cmp-under, but I don't think I need the plugin for this.
					-- I might add some more of my own.
					function(entry1, entry2)
						local _, entry1_under = entry1.completion_item.label:find("^_+")
						local _, entry2_under = entry2.completion_item.label:find("^_+")
						entry1_under = entry1_under or 0
						entry2_under = entry2_under or 0
						if entry1_under > entry2_under then
							return false
						elseif entry1_under < entry2_under then
							return true
						end
					end,

					compare.kind,
					compare.sort_text,
					compare.length,
					compare.order,
				},
			},
			formatting = {
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					-- Source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})

		-- cmp `/` cmdline setup
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- cmp `:` cmdline setup
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		-- cmp VimTeX setup
		cmp.setup.filetype("tex", {
			sources = {
				{ name = "vimtex" },
				{ name = "luasnip" },
				{ name = "buffer" },
			},
		})
	end,
}
