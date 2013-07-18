"-------------------------------------------------------------------------------
" Vim Initial Setup
"-------------------------------------------------------------------------------

" init vim-pathogen
execute pathogen#infect()

set nocompatible
filetype off

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number

" store swap/backup files in one folder
set backupdir=~/.vim/.backup,/tmp
set directory=~/.vim/.backup,/tmp

filetype plugin indent on     " required!

" replace default leader backslash with comma
let mapleader = ","

"-------------------------------------------------------------------------------
" Color Scheme & Syntax Highlighting 
"-------------------------------------------------------------------------------

set background=dark
colorscheme base16-default
syntax on

"-------------------------------------------------------------------------------
" Customizations
"-------------------------------------------------------------------------------

" disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" navigate splits with the arrow keys
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" highlight trailing spaces
set list listchars=tab:\ \ ,trail:·

" split-it mapping
nmap <leader>-  :new<CR>
nmap <leader>\|  :vnew<CR>
nmap <leader>\  :rightbelow vnew<CR>
nmap <leader>_  :rightbelow new<CR>

" fix tmux arrow key mappings
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" resize split w/ shift+arrow
nmap <silent> <S-Down> :resize -5<CR>
nmap <silent> <S-Up> :resize +5<CR>
nmap <silent> <S-Left> :vertical resize -5<CR>
nmap <silent> <S-Right> :vertical resize +5<CR>

" allow backspace to delete end-of-line in insert mode
set backspace=indent,eol,start

"-------------------------------------------------------------------------------
" Plugin Configs
"-------------------------------------------------------------------------------

" CtrlP
""""""""
" open buffer list on
nnoremap <c-b> :CtrlPBuffer<CR>
" clear ctrlp cache then open ctrlp
nnoremap <silent> <c-l> :ClearCtrlPCache<cr>\|:CtrlP<cr>
" search .* files/folders
let g:ctrlp_show_hidden = 1
" custom file/folder ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" add wildignores for python projects
set wildignore+=*/.ve/*,*/.venv/*
set wildignore+=*/*.egg-info/*,*/.tox/*


" EasyMotion
"""""""""""""
let g:EasyMotion_leader_key = '<Leader>' 


" NERDTree
"""""""""""
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']


" Powerline
""""""""""""
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


" ZoomWin
""""""""""
"map <Leader>\ <C-w>o
map <Leader><Leader> <C-w>o


" Tabularize
"""""""""""""
nmap <Leader>a+ :Tabularize /=<CR>
vmap <Leader>a+ :Tabularize /=<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=/<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=/<CR>
nmap <Leader>a; :Tabularize /:<CR>
vmap <Leader>a; :Tabularize /:<CR>
nmap <Leader>a: :Tabularize /:\s*\zs/l0r1<CR>
vmap <Leader>a: :Tabularize /:\s*\zs/l0r1<CR>
nmap <Leader>ap :Tabularize /import<CR>
vmap <Leader>ap :Tabularize /import<CR>


"-------------------------------------------------------------------------------
" Custom FileType Settings
"-------------------------------------------------------------------------------

" coffeescript, html, htmldjango, jade, less, stylus
au FileType coffee,html,htmldjango,jade,less,stylus,json
    \ set shiftwidth=2 softtabstop=2 tabstop=2 textwidth=239

"-------------------------------------------------------------------------------
" Load OS Specific Config Files
"-------------------------------------------------------------------------------

if has('win32')
    source ~/.vim/.vimrc.win
elseif has('mac')
    source ~/.vim/.vimrc.osx
elseif has('unix')
    source ~/.vim/.vimrc.linux
endif
