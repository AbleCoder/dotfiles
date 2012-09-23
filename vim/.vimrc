"-------------------------------------------------------------------------------
" Vim Initial Setup
"-------------------------------------------------------------------------------

set nocompatible
filetype off

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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
Bundle 'vim-scripts/bash-support.vim'
Bundle 'klen/python-mode'

" tab/auto complete
Bundle 'ervandew/supertab'

" tmux
Bundle 'benmills/vimux'

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

" allow backspace to delete end-of-line in insert mode
set backspace=eol

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"-------------------------------------------------------------------------------
" Bundle Configs
"-------------------------------------------------------------------------------

" CoffeeScript
"""""""""""""""
" open coffeescript compile window vertically
let coffee_compile_vert = 1


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
  \ 'dir':  '\v[\/]\.(git|hg|svn|ve)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" EasyMotion
"""""""""""""
let g:EasyMotion_leader_key = '<Leader>' 


" Lusty
""""""""
" hide buffers when they are abandoned
set hidden


" Powerline
""""""""""""
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


" python-mode
""""""""""""""
" do NOT load rope plugin
let g:pymode_rope = 0
" disable python folding
let g:pymode_folding = 0
" disable pylint checking every save
let g:pymode_lint_write = 0


" SuperTab
"""""""""""
" fix highlight cur item in tab complete menu
autocmd VimEnter * highlight Pmenu ctermbg=238 gui=bold


" Tagbar (ctags)
"""""""""""""""""
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


" Vimux
""""""""
"map <Leader>vp :VimuxPromptCommand<CR>
"map <Leader>vl :VimuxRunLastCommand<CR>
"map <Leader>vi :VimuxInspectRunner<CR>
"map <Leader>vq :VimuxCloseRunner<CR>
"map <Leader>vx :VimuxClosePanes<CR>
"map <Leader>vc :VimuxClearRunnerHistory<CR>
"map <Leader>vs :call VimuxRunCommand("~/tvim-toggle-cli-panel", 1)<CR>


"-------------------------------------------------------------------------------
" Tmux Custom Scripts/Mappings
"-------------------------------------------------------------------------------

" toggle tmux pane for cli (capital C for BIG cli pane)
noremap <silent> <Leader>c :silent !~/tvim-toggle-cli-pane<CR>
noremap <silent> <Leader>C :silent !~/tvim-toggle-cli-pane -b<CR>

"-------------------------------------------------------------------------------
" Custom FileType Settings
"-------------------------------------------------------------------------------

" HTML, HTMLDJANGO, LESS
au FileType coffee,html,htmldjango,less
    \ set shiftwidth=2 softtabstop=2 tabstop=2 textwidth=239
