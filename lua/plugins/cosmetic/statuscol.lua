return {
	"luukvbaal/statuscol.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	opts = function()
		local builtin = require("statuscol.builtin")
		local opts = {
			relculright = true,
			segments = {
				{
					sign = {
						name = { "todo" },
						auto = true,
					},
					condition = {
						function()
							return TODO_COMMENTS_LOADED ~= nil
						end,
					},
				},
				{
					text = { builtin.foldfunc, " " },
					click = "v:lua.ScFa",
				},
				{
					sign = {
						namespace = { ".*diagnostic.*" },
						auto = true,
						colwidth = 2,
						fillcharhl = "LineNr",
						maxwidth = 1,
					},
					click = "v:lua.ScSa",
				},
				{
					sign = {
						name = { "Dap" },
						auto = true,
					},
				},
				{
					text = { builtin.lnumfunc, " " },
					click = "v:lua.ScLa",
					condition = { true },
				},
				{
					click = "v:lua.ScSa",
					sign = {
						namespace = { "gitsigns" },
						-- 	maxwidth = 2,
						-- 	colwidth = 1,
						wrap = true,
					},
				},
			},
		}
		return opts
	end,
}
