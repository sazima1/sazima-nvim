local usercmd = vim.api.nvim_create_user_command

usercmd("Todo", "edit ~/.sazima1/notes/to-dos.md", {})
usercmd("Config", "cd ~/.config/nvim|Telescope find_files", {})
usercmd("Cfg", "cd ~/.config/nvim|Telescope find_files", {})
