# My Dotfiles

This repository contains my personal dotfiles for various tools.

## Installation

1.  Clone this repository to your home directory:
    ```bash
    git clone <repository-url> ~/dotfiles
    ```
2.  Run the installation script:
    ```bash
    cd ~/dotfiles
    ./install.sh
    ```
3.  Open vim and run `:PlugInstall` to install the vim plugins.

<<<<<<< HEAD
## Included Configurations

*   tmux
*   vim
*   bash
*   coc.nvim for LSP
=======
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```
   Or manually download and place files in `~/dotfiles`

2. Make the installation script executable:
   ```bash
   chmod +x ~/dotfiles/install.sh
   ```

3. Run the installation script:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

The installation script will:
- Create symbolic links from the dotfiles to your home directory
- Back up any existing configuration files to `~/dotfiles/backup/`
- Provide feedback about the installation process

## Configuration Details

### Bash Configuration (`.bashrc`)

The `.bashrc` file contains:
- Custom prompt configuration
- Useful aliases for common commands
- Environment variable settings
- Path configurations

After installation, you might need to restart your terminal or run `source ~/.bashrc` for changes to take effect.

### Vim Configuration (`.vimrc` and `.vim/`)

The Vim configuration includes:
- Syntax highlighting
- Line numbering
- Custom color scheme
- Key mappings for improved productivity
- Various helpful plugins (if any are installed)

### Clang Format (optional)

If a `.clang-format` file exists in the repository, it will be linked to provide consistent C/C++ code formatting.

## Backup

The installation script automatically backs up your existing configuration files before creating symbolic links. Backups are stored in `~/dotfiles/backup/` with timestamps.
