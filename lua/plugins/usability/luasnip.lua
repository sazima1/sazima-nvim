return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets/" })

		local luasnip = require("luasnip")
		luasnip.setup({
			update_events = { "TextChanged", "TextChangedI" },
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
			load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
			ft_func = require("luasnip_snippets.common.snip_utils").ft_func,
		})

		-- Keymaps
		local map = vim.keymap.set

		map({ "i" }, "<C-K>", function()
			luasnip.expand()
		end, { silent = true, desc = "expand autocomplete" })
		map({ "i", "s" }, "<C-L>", function()
			luasnip.jump(1)
		end, { silent = true, desc = "next autocomplete" })
		map({ "i", "s" }, "<C-J>", function()
			luasnip.jump(-1)
		end, { silent = true, desc = "previous autocomplete" })
		map({ "i", "s" }, "<C-E>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true, desc = "Select LuaSnip autocomplete" })

		-------- OTHER KEYMAPS IN cmp.lua FOR TAB-BASED JUMPING ---------
	end,
}
