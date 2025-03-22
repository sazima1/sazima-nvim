--[[
Name: Mini.Files
Language: N/A
Description: File explorer from mini.nvim
--]]
return {
	"echasnovski/mini.files",
	version = false,
	opts = {},
	keys = {
		{ "<leader>fm", "<Cmd>lua MiniFiles.open()<CR>", mode = { "n" }, noremap = true, desc = "Open mini.files file explorer" },
	},
}
