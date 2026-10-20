# Senior Architect Dotfiles

A modular, high-productivity development environment featuring Vim, Bash, and Tmux, optimized for performance and aesthetic consistency with the **Gruvbox** theme.

## 🚀 Features

- **Modular Architecture**: Clean separation of concerns for easy maintenance.
- **Vim**: Optimized with `coc.nvim` (LSP), `fzf`, and `NERDTree`.
- **Bash**: Enhanced with `starship` prompt, `zoxide` (smart cd), and `fzf` integration.
- **Tmux**: Professional status bar with Gruvbox colors and prefix `C-a`.
- **42 Cursus Optimized**: Built-in support for 42 headers and C/C++ formatting.

## 🛠️ Installation

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the installer
The installer will backup existing configs, create symlinks, and check for required tools.
```bash
./install.sh
```

### 3. Finalize Vim
Open Vim and install plugins:
```bash
vim +PlugInstall +qall
```

## 📦 Requirements & Dependencies

The `install.sh` script will check for these, but you can install them manually:

- **[Starship](https://starship.rs/)**: The minimal, blazing-fast, and infinitely customizable prompt.
- **[FZF](https://github.com/junegunn/fzf)**: A command-line fuzzy finder.
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)**: A smarter cd command.
- **[Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm)**: Manage tmux plugins.
- **[Vim-Plug](https://github.com/junegunn/vim-plug)**: Minimalist Vim plugin manager.

## 📂 Structure

```text
~/dotfiles/
├── bash/             # Modular bash configs
│   ├── aliases.bash  # Custom shortcuts
│   ├── config.bash   # History, shopt, etc.
│   └── functions.bash # Utility functions
├── vim/              # Modular vim configs
│   ├── plugins.vim   # Plugin declarations
│   ├── settings.vim  # General settings
│   ├── theme.vim     # Gruvbox configuration
│   └── coc-config.vim # LSP settings
├── tmux/             # Tmux configuration
└── install.sh        # Automated setup script
```

## ⌨️ Custom Keybindings (Vim)

- `<leader>` is set to `Space`.
- `<leader>f`: Find files (FZF)
- `<leader>e`: Toggle NERDTree
- `<leader>w`: Save file
- `<leader>n/p`: Next/Previous buffer
- `gd`: Go to definition (LSP)
- `K`: Show documentation (LSP)
