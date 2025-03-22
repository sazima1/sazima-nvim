local g = vim.g
local set = vim.opt

-- basic stuff
set.compatible = false
set.relativenumber = false
set.number = true
set.belloff = "all"
set.splitright = true
set.mouse = "i"
set.backup = false
set.fileformats = "unix,dos"

-- spacing, widths, heights
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.scrolloff = 8
set.smartindent = true
set.expandtab = true
set.shiftround = true
set.autoindent = true
set.autoread = true

-- sessions
-- possible values: blank, buffers, curdir, folds, globals, help, localoptions, options, skiprtp, resize, sesdir, tabpages, terminal, winpos, winsize, slash, unix
set.sessionoptions = "blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winpos,winsize"
-- suggested by persisted
-- set.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
-- suggested by auto-session.nvim
-- set.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
set.tabpagemax = 1000

-- folding
set.foldmethod = "manual"
set.foldmarker = "{{{,}}}"

-- cursor and typing behavior
set.wrap = false
set.linebreak = true
set.list = false
set.wrapmargin = 0

-- some cosmetic stuff
set.cursorline = true
set.ruler = true
set.incsearch = true
set.hlsearch = true
set.smartcase = true
set.termguicolors = true
set.showtabline = 0
set.laststatus = 3

-- clipboard with osc52 (check terminal support https://mil.ad/blog/2024/remote-clipboard.html). We need to do a different paste option
if vim.env.SSH_TTY then
	local function wt_paste()
		return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
	end
	local osc52 = require("vim.ui.clipboard.osc52")
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = osc52.copy("+"),
			["*"] = osc52.copy("*"),
		},
		paste = {
			["+"] = wt_paste,
			["*"] = wt_paste,
		},
	}
end
-- vimtex and latex
g.vimtex_view_general_viewer = "okular"
g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
g.tex_flavor = "latex"

-- python
-- g.python3_host_prog = os.getenv("HOME") .. "/.local/venv/nvim/bin/python3"

-- markdown
g.markdown_fenced_languages = { "diablo", "ingrid" }

-- spellchecking
set.spelllang = "en_us"
set.spell = false
