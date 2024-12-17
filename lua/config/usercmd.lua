local usercmd = vim.api.nvim_create_user_command

usercmd("Bd", function()
	require("snacks").bufdelete()
end, {})
usercmd("Todo", "edit ~/.sazima1/notes/to-dos.md", {})
usercmd("Daily", function()
	vim.cmd([[cd ~/.sazima1/notes]])
	vim.cmd([[ZkNew { dir = 'daily' }]])
end, {})
usercmd("Config", "cd ~/.config/nvim|Telescope find_files", {})
usercmd("Cfg", "cd ~/.config/nvim|Telescope find_files", {})
usercmd("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true, desc = "Format current buffer" })
usercmd("Notifications", "lua Snacks.notifier.show_history()", {})
