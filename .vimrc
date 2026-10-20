" Modular Vim Configuration

let g:dotfiles_vim = expand('~/dotfiles/vim')

exec 'source ' . g:dotfiles_vim . '/plugins.vim'
exec 'source ' . g:dotfiles_vim . '/settings.vim'
exec 'source ' . g:dotfiles_vim . '/theme.vim'
exec 'source ' . g:dotfiles_vim . '/mappings.vim'
exec 'source ' . g:dotfiles_vim . '/coc-config.vim'

" Local overrides (if any)
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
