set number
" set relativenumber
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

inoremap jk <ESC>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-r> :so %<CR>

let mapleader = "," " map leader to comma
" set timeoutlen 1000 " Set timeout length to 1000 ms


colorscheme gruvbox
" set background=light
set background=dark
let g:airline_theme='gruvbox'
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light='medium'
" let g:gruvbox_contrast_light='soft'
let g:gruvbox_transparent_bg=1
" autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE


let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if (has('termguicolors'))
	set termguicolors
endif


" let g:gruvbox_contrast_dark = 'medium'
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif




call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'


Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'



Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion

" Plug 'prabirshrestha/vim-lsp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()




lua << EOF
-- TELESCOPE CONFIG
require('telescope').setup {
  pickers = default_picker_opts,
  defaults = { 
	previewer = true,
	file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, 
    
	color_devicons = true,
    -- prompt_prefix = '🔍 ',
    scroll_strategy = 'cycle',
    -- sorting_strategy = 'ascending',
    layout_strategy = 'flex',
    file_ignore_patterns = ignore_these,
    
  },
  extensions = {

  },
}
EOF
" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF

" Using Lua functions
nnoremap ,ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap ,fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap ff <cmd>Telescope find_files<cr>
" nnoremap fg <cmd>Telescope live_grep<cr>


" NerdTree setup
let NERDTreeShowHidden=1
nnoremap nnf :NERDTreeFocus<CR>
nnoremap nnt :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><C-p> :tabp<cr>
map <C-t><C-t> :tabn<cr>


nmap <F8> :TagbarToggle<CR>



" coc-setup 
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" 

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


" set completeopt-=preview " For No Previews


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE



" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" map <F9> :w <bar> !g++ -std=c++17 % -o %:r <CR>
" map <F10> :!%:r<CR>



" for detecting OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" important option that should already be set!
set hidden

" available options:

let g:split_term_style = 'vertical'
" let g:split_term_style = 'horizontal'

let g:split_term_resize_cmd = 'vertical resize 45'
" let g:split_term_resize_cmd = 'resize 6'

function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	exec buffercmd
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
	autocmd BufEnter <buffer> startinsert
endfunction

command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 %s && ./a.out', expand('%')))
command! -nargs=0 CompileAndRunPython call TermWrapper(printf('!python3', expand('%')))
command! -nargs=1 -complete=file CRF call TermWrapper(printf('g++ -std=c++17 %s && ./a.out < %s', expand('%'), <q-args>))
autocmd FileType cpp map <C-b> :CompileAndRun<CR>
autocmd FileType py map <C-b> : 


" For those of you that like to use -o and a specific outfile executable
" (i.e., xyz.cpp makes executable xyz, as opposed to a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
augroup CppToolkit
	autocmd!
"	if g:os == 'Darwin'
"		autocmd FileType cpp nnoremap <leader>fn :!g++ -std=c++17 -o %:r % && open -a Terminal './%:r'<CR>
"	endif
	autocmd FileType cpp nnoremap <leader>fn :!g++ -std=c++17 -o %:r % && open -a Terminal './%:r'<CR>
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++17 -o %:r % && ./%:r<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./%:r.out<CR>
augroup END

" https://github.com/mizlan/vim-and-cp/blob/master/cp.vim


