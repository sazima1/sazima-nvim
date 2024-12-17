local ls = require("luasnip") -- Import the LuaSnip module
local s = ls.snippet -- Shortcut for defining a snippet
local t = ls.text_node -- Shortcut for defining a text node
local i = ls.insert_node -- Shortcut for defining an insert node

-- Define the snippet
ls.add_snippets("python", {
	s({ trig = "main" }, {
		i(0),
		t({ "", "", "def main():", "\t" }),
		i(1, "pass"),
		t({ "", "", "", 'if __name__ == "__main__":', "\tmain()" }),
	}),
})
