local usercmd = vim.api.nvim_create_user_command

usercmd("Todo", "edit ~/.sazima1/notes/to-dos.md", {})
usercmd("Config", "cd ~/.config/nvim|lua Snacks.picker.smart()", {})
usercmd("Cfg", "cd ~/.config/nvim|lua Snacks.picker.smart()", {})
