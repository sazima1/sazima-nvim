local g = vim.g
local set = vim.opt

set.compatible = false
set.relativenumber = true
set.number = true
set.belloff = "all"

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.shiftround = true
set.scrolloff = 8
set.smartindent = true
set.autoindent = true
set.autoread = true

set.splitright = true

-- possible sessionoptions:
-- blank, buffers, curdir, folds, globals, help, localoptions, options, skiprtp, resize, sesdir, tabpages, terminal, winpos, winsize, slash, unix
set.sessionoptions = "blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winpos,winsize"
-- suggested by persisted
-- set.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
-- suggested by auto-session.nvim
-- set.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
--
set.tabpagemax = 1000

set.foldmethod = "manual"

set.wrap = true
set.linebreak = true
set.list = false
set.wrapmargin = 0
set.cursorline = true

set.ruler = true
set.fileformats = "unix,dos"
set.backup = false

set.incsearch = true
set.hlsearch = true
set.smartcase = true
set.termguicolors = true

set.mouse = "i"

-- set.signcolumn = "yes"

-- set.title = true
-- set.titlestring = "%f"
set.showtabline = 0
set.laststatus = 3

-- VimTeX
g.vimtex_view_general_viewer = "okular"
g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"

-- Python
-- g.python3_host_prog = os.getenv("HOME") .. "/.local/venv/nvim/bin/python3"

-- Markdown
g.markdown_fenced_languages = { "diablo", "ingrid" }

-- Spellchecking
set.spelllang = "en_us"
set.spell = false
