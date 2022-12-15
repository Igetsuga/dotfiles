" ----------------------------------------------------------------------------
" ---------------------------SET----------------------------------------------
set number
set relativenumber
set encoding=UTF-8
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set cursorline
set colorcolumn=79
filetype indent on

syntax on " highlight syntax
set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type

set splitbelow
set splitright
set noea
set completeopt-=preview " For No Previews

" ----------------------------------------------------------------------------
" ---------------------------MAPPING------------------------------------------
" set timeoutlen 1000 " Set timeout length to 1000 ms
let mapleader = "," " map leader to comma

inoremap jk <ESC>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-r> :so %<CR>


" move throught windows
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><C-p> :tabp<cr>
map <C-t><C-t> :tabn<cr>


nmap <F8> :TagbarToggle<CR>


" ----------------------------------------------------------------------------
" ---------------------------Terminal-----------------------------------------


if (has("termguicolors"))
  set termguicolors
endif




" ----------------------------------------------------------------------------
" ---------------------------NerdTree-----------------------------------------
let NERDTreeShowHidden=1
nnoremap nnf :NERDTreeFocus<CR>
nnoremap nnt :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" ----------------------------------------------------------------------------
" --------------------------------------------------------------------





call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'



Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" telescope plugin and its dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' " fuzzy finder






" other stuff
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " Ctrl+N for multiple cursors

call plug#end()

let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight-moon


" external config files (in lua)
luafile ~/.config/nvim/lsp.lua
luafile ~/.config/nvim/nvim-cmp.lua



" map <F9> :w <bar> !g++ -std=c++17 % -o %:r <CR>

