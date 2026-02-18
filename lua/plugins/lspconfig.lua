--[[
Name: Nvim LSP Config
Language: N/A
Description: Default LSP client configurations for many servers
Notes:
  - Edits to these configs can be made with an lsp config file under <config_root>/lsp/<server>.lua
  - To activate a language server, add a config file to <config_root>/lsp/<server>.lua, even if it's empty. Files are read and the LSP is activated in the "lsp.lua" file 
--]]
return {
	"neovim/nvim-lspconfig",
}
