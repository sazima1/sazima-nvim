--[[
Name: LuaSnip
Language: N/A
Description: Lua-based snippet engine
--]]
return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	dependencies = {
		-- {
		-- 	"rafamadriz/friendly-snippets",
		-- 	opts = {},
		-- 	config = function(_, opts)
		-- 		require("luasnip.loaders.from_vscode").lazy_load()
		-- 		require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
		-- 	end,
		-- },
		-- {
		-- 	"mireq/luasnip-snippets",
		-- 	opts = {},
		-- 	config = function(_, opts)
		-- 		require("luasnip_snippets.common.snip_utils").setup(opts)
		-- 	end,
		-- },
	},
	opts = function()
		local opts = {
			update_events = { "TextChanged", "TextChangedI" },
			enable_autosnippets = true,
			-- store_selection_keys = "<Tab>",
			-- load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
			-- ft_func = require("luasnip_snippets.common.snip_utils").ft_func,
		}
		return opts
	end,
	keys = {
		{
			"<C-K>",
			function()
				require("luasnip").expand()
			end,
			mode = { "i" },
			silent = true,
			desc = "expand autocomplete",
		},
		{
			"<C-L>",
			function()
				require("luasnip").jump(1)
			end,
			mode = { "i", "s" },
			silent = true,
			desc = "next autocomplete",
		},
		{
			"<C-J>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
			silent = true,
			desc = "previous autocomplete",
		},
		{
			"<C-E>",
			function()
				if require("luasnip").choice_active() then
					require("luasnip").change_choice(1)
				end
			end,
			mode = { "i", "s" },
			silent = true,
			desc = "Select LuaSnip autocomplete",
		},
	},
}
