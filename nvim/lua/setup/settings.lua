-- https://github.com/Igetsuga/dotfiles/tree/general
-- https://github.com/jessfraz/.vim/blob/master/vimrc good vimrc example



local g = vim.g
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd




--
-- other (i don't really know what some of them do)
--
-- " Enable file type detection.
-- " Use the default filetype settings, so that mail gets 'tw' set to 72,
-- " 'cindent' is on in C files, etc.
-- " Also load indent files, to automatically do language-dependent indenting.
-- vim.api.nvim_command('filetype plugin indent on')
cmd([[
filetype indent plugin on
syntax enable
]])
opt.mouse    = 'a'              -- enable mouse
opt.so       = 999              -- cursor-line always in center of screen
-- backspace   = indent,eol,start -- ??
o.hidden     = true             -- ??
o.history    = 50
o.autowrite  = true             -- auto save before :next, :make etc
o.autoread   = true             -- auto reread changed files without asking me anything
o.scrolloff  = 10               -- 
opt.encoding = "utf-8"
-- opt.fileformats = unix, dos, mac

--
-- nvim looks
--
opt.termguicolors = true
-- o.background = 'dark'
-- vim.cmd[[colorscheme tokyonight-storm]]
vim.cmd[[colorscheme base16-gruvbox-dark-medium]]



--
-- tagbar
--
g.tagbar_compact = 1 -- compact tagbar view 
g.tagbar_sort    = 0 -- disable alphabetic tags sort 




--
-- Decrease update time
--
o.timeoutlen = 9999
o.updatetime = 200


--
-- editor settings
--
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.colorcolumn = 119

--
-- tab & indents settings
--
o.expandtab   = true 
o.smarttab    = true
o.cindent     = true 
o.autoindent  = true
o.tabstop     = 4
o.shiftwidth  = 4
o.softtabstop = - 1 -- if negative, shiftwidth is used 
o.wrap        = true
o.textwidth   = 300

o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'
----------------------------------------------------
----------------------------------------------------
----------------------------------------------------


--
-- Makes neovim and host OS clipboard play nicely with each other
--
o.clipboard = "unnamedplus"

--
-- Case insensitive searching UNLESS /C or capital in search
--
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true 


--
-- Undo and backup options
--
o.backup      = false
o.writebackup = false
o.undofile    = true
o.swapfile    = false


--
-- Splitting
--
o.splitright = true
o.splitbelow = true


