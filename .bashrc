# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source modular configurations
DOTFILES_BASH="$HOME/dotfiles/bash"

[ -f "$DOTFILES_BASH/config.bash" ] && . "$DOTFILES_BASH/config.bash"
[ -f "$DOTFILES_BASH/aliases.bash" ] && . "$DOTFILES_BASH/aliases.bash"
[ -f "$DOTFILES_BASH/functions.bash" ] && . "$DOTFILES_BASH/functions.bash"

# External tools
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

# Starship Prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Keychain
if command -v keychain >/dev/null 2>&1; then
    eval $(keychain --eval --agents ssh id_ed25519)
fi
