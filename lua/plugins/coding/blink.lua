return {
	"saghen/blink.cmp",
	-- enabled = false,
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
		},
	},
	-- use a release tag to download pre-built binaries
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
			trigger = {
				show_in_snippet = false,
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label" },
						{ "label_description" },
						{ "kind_icon" },
						{ "kind" },
					},
				},
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = {
			enabled = true,
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
	-- opts_extend = { "sources.default" },
}
