set nocompatible  
filetype on 
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'

Plugin 'valloric/youcompleteme'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()            " required

syntax on
colorscheme idle
" set smartindent
set showmatch
set foldcolumn=1
set shiftwidth=3
set tabstop=3
filetype plugin on
filetype indent on
set autoread
set mouse=a
set magic
set number
set relativenumber
set wildmenu
set title
set pastetoggle=<F2>
cmap w!! w !sudo tee % >/dev/null
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoread
let &titleold=getcwd()
set scrolloff=3
set gdefault

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

command! W w
command! Wq wq
command! Q q

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

let g:vimtex_view_method = 'zathura'

" Enable Folding
set foldmethod=indent
set foldlevel=99
" Fold with <space>
nnoremap <space> za

"nerdTree
"Open when only vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Nerd when open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"Shortcut to nerd
map <C-o> :NERDTreeToggle<CR>
"Close vim if only nerd left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline#extensions#tabline#enabled = 1
" move among buffers with CTRL
map <C-n> :bnext<CR>
map <C-b> :bprev<CR>

" YCM
" let g:ycm_python_binary_path = 'usr/bin/python3'

" supertab
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:SuperTabLongestHighlight = 1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Jedi
autocmd FileType python setlocal completeopt-=preview

autocmd FileType python set omnifunc=pythoncomplete#Complete

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Python
au BufNewFile,BufRead *.py :setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab fileformat=unix
