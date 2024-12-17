return {
	"mireq/luasnip-snippets",
	dependencies = { "L3MON4D3/LuaSnip" },
	opts = {},
	config = function(_, opts)
		-- Mandatory setup function
		require("luasnip_snippets.common.snip_utils").setup(opts)
	end,
}
