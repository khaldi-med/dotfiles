"VimCake version: 0.2.1-pre

"--------------------------------------------------------------
"                     General Settings
"--------------------------------------------------------------
set nocompatible              " Disable vi compatibility
filetype off                  " Required for Vundle

set mouse=a                   " Enable mouse support
set number relativenumber     " Hybrid line numbers
set showcmd                   " Show command in status line
set wildmenu                  " Better tab completion
set showmatch                 " Highlight matching brackets
set ruler                     " Show cursor position
set hlsearch incsearch        " Search highlighting
set smartcase                 " Case-sensitive search when uppercase
syntax enable                 " Enable syntax highlighting
set termguicolors            " Enable true color support

"--------------------------------------------------------------
"                     Terminal Color Settings
"--------------------------------------------------------------
" Properly detect and handle colors in tmux
if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  
  " Set Vim-specific sequences for RGB colors
  set t_ZH=[3m
  set t_ZR=[23m
  
  " Fix background color erase
  set t_ut=
endif

" Force Vim to use 256 colors if terminal supports it
if &term =~ '256color'
  " Disable Background Color Erase (BCE)
  set t_ut=
endif

" Adjust cursor style for better visibility
let &t_SI = "\<Esc>[6 q"  " Insert mode - vertical bar
let &t_SR = "\<Esc>[4 q"  " Replace mode - underscore
let &t_EI = "\<Esc>[2 q"  " Normal mode - block

"--------------------------------------------------------------
"                     Indentation & Tabs
"--------------------------------------------------------------
set tabstop=4                 " Visible width of tabs
set softtabstop=4             " Edit as if tabs are 4 spaces
set shiftwidth=4              " Indent amount for << and >>
set expandtab                 " Convert tabs to spaces
set autoindent smartindent    " Automatic indentation
filetype plugin indent on     " Filetype-specific indentation


"--------------------------------------------------------------
"                     Plugins (Vim-plug)
"--------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" LSP Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Language Server Protocol support
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
"Plug 'lilydjwg/colorizer'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'sirver/ultisnips'
Plug 'pbondoer/vim-42header'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'
" Additional color schemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'arcticicestudio/nord-vim'
Plug 'cacharle/c_formatter_42.vim'
Plug 'honza/vim-snippets'
" JavaScript syntax highlighting and support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
" surround text
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

colorscheme evening 

filetype plugin on
" YouCompleteMe configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" Syntastic C settings
let g:syntastic_c_checkers = ['gcc', 'clang']
let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" C specific settings
autocmd FileType c setlocal cindent
autocmd FileType c setlocal cinoptions=g0

" Clang format settings
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" Add key mapping for clang format
autocmd FileType c noremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Enhanced C syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:airline_theme='dark'
let g:colorizer_maxlines = 512

" JavaScript syntax highlighting configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
nmap <F2> :Stdheader<CR>
let g:hdr42user="mohkhald"
let g:hdr42mail="mohkhald@student.1337.ma"

"<User Interface>"
" syntax on " Redundant - already enabled above
set mouse=a "Enable mouse
set number "Show line numbers
set showcmd "Show the last command in bottom bar
set wildmenu "Visual autocompletion for command menu
set showmatch "Highlight matching [{()}] 
set ruler "Always show cursor position
set list "Enable lists
set listchars=tab:\>\- "Show tabs
set foldmethod=syntax "Fold based on indention levels
set foldcolumn=1 "Enable mouse to open and close folds
set nofoldenable "Open files without closed folds
set confirm "Display a confirmation dialog when closing an unsaved file
"Toggle fold/unfold all folds
noremap <F3> :call FoldToggle()<CR>

"<Indent>"
filetype indent on "Enable indentation rules that are file-type specific
set tabstop=4 "Indent using four spaces
set softtabstop=4 "Number of spaces in <Tab>
set shiftwidth=4 "When shifting, indent using four spaces
set autoindent "New lines inherit the indentation of previous lines
set smarttab "Insert “tabstop” number of spaces with the “tab” key
set smartindent "Do smart autoindenting when starting a new line
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

"<Search>"
set hlsearch "Search highlighting
set incsearch "Incremental search that shows partial matches
set smartcase "Automatically switch search to case-sensitive when search query contains an uppercase letter

"<Miscellaneous>"
set backupdir=~/.cache/vim "Directory to store backup files
set dir=~/.cache/vim "Directory to store swap files
set history=256 "Stack size
set tabpagemax=64 "Maximum number of files that can be opened with vim -p
set lazyredraw "Don’t update screen during macro and script execution

let $fold=1
function FoldToggle()
	if $fold==0
		:exe "normal zR"
		let $fold=1
	else
		:exe "normal zM"
		let $fold=0
	endif
endf

" Commentary plugin mapping
noremap <leader>c gcc

let g:c_formatter_42_set_equalprg=1
let g:c_formatter_42_format_on_save=0

" --------------------------------------------------------------
"                    CoC (LSP) Configuration
" --------------------------------------------------------------
" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn to avoid shifting text
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Install clangd language server extension for CoC
" Run this command after installing plugins:
" :CocInstall coc-clangd

" Create a CoC configuration file if it doesn't exist
if empty(glob('~/.vim/coc-settings.json'))
  call system('mkdir -p ~/.vim')
  let coc_settings = {
        \ "languageserver": {
        \   "clangd": {
        \     "command": "clangd",
        \     "rootPatterns": ["compile_flags.txt", "compile_commands.json", ".git"],
        \     "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"],
        \     "args": ["--background-index", "--clang-tidy"]
        \   }
        \ },
        \ "clangd.path": "clangd",
        \ "clangd.arguments": ["--background-index", "--clang-tidy"],
        \ "suggest.noselect": v:false,
        \ "suggest.enablePreselect": v:true,
        \ "suggest.enablePreview": v:true,
        \ "suggest.maxCompleteItemCount": 20,
        \ "coc.preferences.formatOnSaveFiletypes": ["c", "cpp"],
        \ "diagnostic.displayByAle": v:false
        \ }
  call writefile([json_encode(coc_settings)], expand('~/.vim/coc-settings.json'))
endif

let g:airline_theme='dark'

" Theme mappings - easily switch themes with leader + t + key
nnoremap <leader>tg :call ThemeSwitcher('gruvbox')<CR>
nnoremap <leader>tn :call ThemeSwitcher('nord')<CR>
nnoremap <leader>td :call ThemeSwitcher('dracula')<CR>
nnoremap <leader>tm :call ThemeSwitcher('monokai')<CR>

" Faster cursor movement
set ttimeoutlen=80
set timeoutlen=300
