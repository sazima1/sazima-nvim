--[[
Name: Fidget
Language: N/A
Description: Nicer notifier window that is less distracting
Notes: N/A
--]]
return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			override_vim_notify = true, -- Automatically override vim.notify() with Fidget
		},
	},
}
