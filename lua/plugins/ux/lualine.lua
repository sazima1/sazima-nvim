return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = { { "filename", path = 3 } },
				lualine_x = { "filetype", "encoding", "%L lines" },
				lualine_y = { "progress" },
			},
		})
	end,
}
