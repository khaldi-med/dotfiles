set nocompatible
filetype plugin indent on
syntax enable

set mouse=a
set number relativenumber
set showcmd
set wildmenu
set showmatch
set ruler
set hlsearch incsearch
set smartcase
set termguicolors
set confirm
set history=1000
set lazyredraw
set scrolloff=8
set sidescrolloff=8

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent smartindent

" Backup & Swap
set backupdir=~/.cache/vim
set directory=~/.cache/vim
set undodir=~/.cache/vim/undo
set undofile

if !isdirectory(expand(&backupdir)) | call mkdir(expand(&backupdir), "p") | endif
if !isdirectory(expand(&undodir)) | call mkdir(expand(&undodir), "p") | endif

" Fix cursor in tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif
