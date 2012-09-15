"-------------------------------------------------------------------------------
" Vim Initial Setup
"-------------------------------------------------------------------------------

set nocompatible
filetype off

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Fixes SuperTab highlight color with base16-default color scheme
highlight Pmenu ctermbg=238 gui=bold

" store swap/backup files in one folder
set backupdir=~/.vim/.backup,/tmp
set directory=~/.vim/.backup,/tmp

"-------------------------------------------------------------------------------
" Vundle Setup & Load
"-------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"-------------------------------------------------------------------------------
" Bundles
"-------------------------------------------------------------------------------

" color scheme
Bundle 'godlygeek/csapprox' 
Bundle 'chriskempson/base16-vim'

" git
Bundle 'tpope/vim-fugitive'

" file/buffer navigation
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
"Bundle 'LustyJuggler'

" movement
Bundle 'Lokaltog/vim-easymotion'
Bundle 'myusuf3/numbers.vim'

" language support
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'rodjek/vim-puppet'
Bundle 'wavded/vim-stylus'

" tab/auto complete
Bundle 'ervandew/supertab'

" visualization/notification
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on     " required!

"-------------------------------------------------------------------------------
" Color Scheme & Syntax Highlighting 
"-------------------------------------------------------------------------------

set background=dark
colorscheme base16-default
syntax on

"-------------------------------------------------------------------------------
" Customizations
"-------------------------------------------------------------------------------

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" navigate splits with the arrow keys
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" retain visual selection when shifting text in visual mode
vmap < <gv
vmap > >gv

" highlight trailing spaces
set list listchars=tab:\ \ ,trail:·

" split-it mapping
nmap <leader>-  :new<CR>
nmap <leader>[  :vnew<CR>
nmap <leader>]  :rightbelow vnew<CR>
nmap <leader>_  :rightbelow new<CR>

"-------------------------------------------------------------------------------
" Bundle Configs
"-------------------------------------------------------------------------------

" CoffeeScript
let coffee_compile_vert = 1

" CtrlP
nnoremap <c-b> :CtrlPBuffer<CR>

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>' 

" Lusty
set hidden

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" Tagbar (ctags)
filetype on
nnoremap <leader>lt :TagbarToggle<CR>

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

"-------------------------------------------------------------------------------
" Custom FileType Settings
"-------------------------------------------------------------------------------

" HTML, HTMLDJANGO, LESS
au FileType coffee,html,htmldjango,less
    \ set shiftwidth=2 softtabstop=2 tabstop=2 textwidth=239
