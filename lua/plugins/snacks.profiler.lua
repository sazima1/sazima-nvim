return {
	{
		"folke/snacks.nvim",
		opts = function()
			-- Toggle the profiler
			Snacks.toggle.profiler():map("<leader><leader>rs")
			-- Toggle the profiler highlights
			Snacks.toggle.profiler_highlights():map("<leader><leader>rh")
		end,
		keys = {
			{
				"<leader><leader>rb",
				function()
					Snacks.profiler.scratch()
				end,
				desc = "Profiler Scratch Buffer",
			},
			{
				"<leader><leader>rp",
				function()
					Snacks.profiler.pick()
				end,
				desc = "Profiler Scratch Buffer",
			},
		},
	},
	-- optional lualine component to show captured events
	-- when the profiler is running
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			table.insert(opts.sections.lualine_x, Snacks.profiler.status())
		end,
	},
}
