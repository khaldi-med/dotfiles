#!/bin/bash

# Senior Architect Dotfiles Installer
# Re-organizes and links modular configurations

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "Creating backup at $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

# List of files to link
FILES=(".bashrc" ".vimrc" ".tmux.conf" ".profile" ".bash_profile")

for file in "${FILES[@]}"; do
    if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
    echo "Linked $file"
done

# Ensure .config exists and link starship
mkdir -p "$HOME/.config"
if [ -f "$HOME/.config/starship.toml" ]; then
    mv "$HOME/.config/starship.toml" "$BACKUP_DIR/"
fi
# Note: We keep starship.toml in .config directly or move it to dotfiles and link it
# For now, let's assume it's part of the dotfiles repo if we want to track it
# ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

echo "------------------------------------------------"
echo "Dotfiles installed successfully!"
echo "Next steps:"
echo "1. Run 'source ~/.bashrc' or restart your terminal."
echo "2. Open Vim and run ':PlugInstall'."
echo "3. If tools are missing, install them:"
echo "   - Starship: curl -sS https://starship.rs/install.sh | sh"
echo "   - FZF: git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
echo "   - Zoxide: curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash"
echo "------------------------------------------------"
