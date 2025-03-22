--[[
Name: Rainbow Delimiters
Language: N/A
Description: Rainbow delimiters in your code
Notes:
  - I have a feeling this plugin will be unneeded in the future
--]]
return {
	"HiPhish/rainbow-delimiters.nvim",
	opts = {},
	config = function(_, opts)
		require("rainbow-delimiters.setup").setup(opts)
	end,
}
