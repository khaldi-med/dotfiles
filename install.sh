#!/bin/bash

# Senior Architect Dotfiles Installer
# Re-organizes, links modular configurations, and manages dependencies

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

printf "${BLUE}Starting Dotfiles Installation...${NC}\n"

# 1. Backup and Symlink
printf "${YELLOW}Step 1: Backing up and Symlinking...${NC}\n"
mkdir -p "$BACKUP_DIR"

FILES=(".bashrc" ".vimrc" ".tmux.conf" ".profile" ".bash_profile")
for file in "${FILES[@]}"; do
    if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
        mv "$HOME/$file" "$BACKUP_DIR/" 2>/dev/null
    fi
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
    printf "  ${GREEN}✓${NC} Linked $file\n"
done

# Ensure .config and starship link
mkdir -p "$HOME/.config"
if [ -f "$HOME/.config/starship.toml" ]; then
    mv "$HOME/.config/starship.toml" "$BACKUP_DIR/" 2>/dev/null
fi
ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml" 2>/dev/null || cp "$HOME/.config/starship.toml" "$DOTFILES_DIR/.config/starship.toml" && ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

# 2. Check for Dependencies
printf "${YELLOW}Step 2: Checking Dependencies...${NC}\n"

install_tool() {
    local tool_name=$1
    local install_cmd=$2
    if ! command -v "$tool_name" >/dev/null 2>&1; then
        printf "  ${RED}!${NC} $tool_name is not installed. "
        read -p "Install it now? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            eval "$install_cmd"
        fi
    else
        printf "  ${GREEN}✓${NC} $tool_name is already installed.\n"
    fi
}

# Starship
install_tool "starship" "curl -sS https://starship.rs/install.sh | sh -s -- -y"

# Zoxide
install_tool "zoxide" "curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash"

# FZF
if [ ! -d "$HOME/.fzf" ]; then
    printf "  ${RED}!${NC} fzf is not installed. "
    read -p "Install it now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all
    fi
else
    printf "  ${GREEN}✓${NC} fzf is already installed.\n"
fi

# TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    printf "  ${YELLOW}*${NC} Installing TPM... "
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    printf "${GREEN}Done${NC}\n"
fi

# Vim-Plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    printf "  ${YELLOW}*${NC} Installing Vim-Plug... "
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    printf "${GREEN}Done${NC}\n"
fi

printf "${BLUE}------------------------------------------------${NC}\n"
printf "${GREEN}Dotfiles installed successfully!${NC}\n"
printf "Backups are located in: $BACKUP_DIR\n\n"
printf "Next steps:\n"
printf "1. Run: ${BLUE}source ~/.bashrc${NC}\n"
printf "2. Open Vim and run: ${BLUE}:PlugInstall${NC}\n"
printf "3. Inside Tmux, press ${BLUE}Prefix + I${NC} to install plugins.\n"
printf "${BLUE}------------------------------------------------${NC}\n"
