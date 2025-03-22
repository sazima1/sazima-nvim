local theme = require("last-color").recall() or "habamax"
vim.cmd.colorscheme(theme)
vim.opt.background = "dark"

-- Custom highlight group settings
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "NonText" })
