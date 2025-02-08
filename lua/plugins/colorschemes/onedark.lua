return {
	"navarasu/onedark.nvim",
	cmd = "OneDarkToggle",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function(_, opts)
		local usercmd = vim.api.nvim_create_user_command
		usercmd("OneDarkToggle", function()
			require("onedark").toggle()
			vim.notify("Switched to theme: " .. vim.g.onedark_config.style, 2, { title = "OneDark Themes" })
		end, {})
	end,
}
