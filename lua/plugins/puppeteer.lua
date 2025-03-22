--[[
Name: nvim-puppeteer
Language: Python
Description: Automatically converts normal strings to f-strings
--]]
return {
	"chrisgrieser/nvim-puppeteer",
	dependencies = "nvim-treesitter/nvim-treesitter",
	ft = { "python", "lua", "javascript", "typescript" },
}
