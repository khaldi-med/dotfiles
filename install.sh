#!/bin/bash

# Dotfiles installation script
# This script creates symbolic links from the dotfiles in this directory to the home directory
# It also backs up existing files if they exist

# Define colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where the script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create backup directory
BACKUP_DIR="$DOTFILES_DIR/backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Function to create symlink and backup existing file if needed
create_symlink() {
    local source="$1"
    local target="$2"
    
    # If the target already exists
    if [ -e "$target" ]; then
        # If it's already a symlink to our file, do nothing
        if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
            echo -e "${GREEN}✓ $target is already linked to $source${NC}"
            return
        fi
        
        # Backup the existing file
        echo -e "${YELLOW}! Backing up $target to $BACKUP_DIR/${target##*/}${NC}"
        mv "$target" "$BACKUP_DIR/${target##*/}"
    fi
    
    # Create the symlink
    echo -e "${GREEN}✓ Creating symlink for $target${NC}"
    ln -sf "$source" "$target"
}

echo "Installing dotfiles..."

# Create symlinks for each dotfile
create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

# Handle .vim directory (which is a directory, not a file)
if [ -d "$DOTFILES_DIR/.vim" ]; then
    if [ -d "$HOME/.vim" ] && [ ! -L "$HOME/.vim" ]; then
        echo -e "${YELLOW}! Backing up $HOME/.vim to $BACKUP_DIR/.vim${NC}"
        mv "$HOME/.vim" "$BACKUP_DIR/.vim"
    fi
    create_symlink "$DOTFILES_DIR/.vim" "$HOME/.vim"
fi

# Optionally add clang-format if it exists
if [ -f "$DOTFILES_DIR/.clang-format" ]; then
    create_symlink "$DOTFILES_DIR/.clang-format" "$HOME/.clang-format"
fi

echo -e "\n${GREEN}Dotfiles installation completed successfully!${NC}"
echo -e "Any original files were backed up to: $BACKUP_DIR"
echo -e "\nYou may need to restart your terminal or run 'source ~/.bashrc' for changes to take effect."

