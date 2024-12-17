return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		theme = "hyper",
		shortcut_type = "number",
		config = {
			-- header = { "", "", "", "", "Iiiiiiiiiiit's Bobby Time", "", "" },
			week_header = { enable = true },
			shortcut = {
				{
					desc = "Open Session ",
					group = "Type",
					key = "s",
					icon = "  ",
					action = "lua vim.cmd([[Telescope persisted]])",
				},
				{
					desc = "Open Last Session ",
					group = "Statement",
					key = "l",
					icon = "󰑓  ",
					action = "lua vim.cmd([[SessionLoadLast]])",
				},
				{
					desc = "Edit Neovim Config ",
					group = "String",
					key = "a",
					icon = "  ",
					action = "lua vim.cmd([[execute 'cd ' stdpath('config')]]) vim.cmd([[Telescope find_files]])",
				},
				{
					desc = "Open Lazy ",
					group = "Identifier",
					key = "z",
					icon = "󰒲  ",
					action = "Lazy",
				},
			},
			footer = { "", "", "", "     Perfect is the mortal enemy of Good Enough" },
		},
	},
	init = function()
		-- open dashboard after closing lazy
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end
	end,
}
