local usercmd = vim.api.nvim_create_user_command

usercmd("Todo", "edit ~/.sazima1/notes/to-dos.md", {})

-- Configuration
usercmd("Config", "cd ~/.config/nvim|lua Snacks.picker.smart()", {})
usercmd("Cfg", "cd ~/.config/nvim|lua Snacks.picker.smart()", {})

-- LSP
usercmd("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })
usercmd("LspRestart", function()
	vim.lsp.stop_client(vim.lsp.get_clients())
	vim.cmd("edit")
end, {
	desc = "Restart running LSP servers",
})
usercmd("LspStop", function()
	vim.lsp.stop_client(vim.lsp.get_clients())
end, {
	desc = "Stops all running LSP servers",
})
usercmd("LspLog", function()
	vim.cmd(string.format("tabnew %s", vim.lsp.get_log_path()))
end, {
	desc = "Opens the Nvim LSP client log",
})
