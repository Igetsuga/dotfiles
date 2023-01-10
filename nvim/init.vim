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

noremap y "+y  
noremap p "+p
noremap yy "+yy

noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>yy "*yy




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
nnoremap <leader>h :nohlsearch<CR>
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

call plug#end()

let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight-moon


" external config files (in lua)
luafile ~/.config/nvim/lsp.lua
luafile ~/.config/nvim/nvim-cmp.lua



" map <F9> :w <bar> !g++ -std=c++17 % -o %:r <CR>



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
