--[[
Name: Crates.nvim
Language: rust Cargo.toml
Description: Helps manage crates.io dependencies
--]]
return {
	"saecki/crates.nvim",
	tag = "stable",
	event = { "BufRead Cargo.toml", "BufRead cargo.toml" },
	opts = {},
}
