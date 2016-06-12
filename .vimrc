call plug#begin('~/.vim/plugged')
     Plug 'itchyny/lightline.vim'
call plug#end()

syntax on
filetype plugin indent on
set nu
set hlsearch
set expandtab
set tw=80
set t_Co=256
set encoding=utf8
set tabstop=4
set shiftwidth=4
set laststatus=2
set timeoutlen=50
set pastetoggle=<F3>
noremap <Tab> <c-w>w
noremap <bs> <c-w>W
:color desert

