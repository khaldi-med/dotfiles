#!/bin/bash
# This script creates symlinks from the home directory to the dotfiles in this repository.

# Get the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks
ln -sf "$DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DIR/.vimrc" "$HOME/.vimrc"
ln -sf "$DIR/.vim" "$HOME/.vim"
ln -sf "$DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DIR/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DIR/.profile" "$HOME/.profile"

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

echo "Dotfiles installed."
echo "Please run :PlugInstall in vim to install the plugins."