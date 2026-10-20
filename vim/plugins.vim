call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP & Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax & Language Support
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pbondoer/vim-42header'
Plug 'cacharle/c_formatter_42.vim'

" Navigation & Search
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utilities
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
