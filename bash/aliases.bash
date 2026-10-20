# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

# Basic Shortcuts
alias c='clear'
alias x='exit'
alias vi='vim'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

# Project-specific (42/C)
alias gcc='gcc -Wall -Wextra -Werror'
alias out='./a.out'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gacp='git add .; git commit -m "update"; git push'

# Docker
alias di='docker images'
alias dp='docker ps -a'
alias dr='docker rm'
alias dri='docker rmi'
alias dpr='docker container prune'
alias dst='docker stop'

# Configuration shortcuts
alias rc='vi ~/.bashrc'
alias src='source ~/.bashrc'
alias vc='vi ~/.vimrc'
alias tc='vi ~/.tmux.conf'
alias srt='tmux source-file ~/.tmux.conf'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Tool replacements (if installed)
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons'
    alias ll='eza -alF --icons --group-directories-first'
fi

if command -v bat >/dev/null 2>&1; then
    alias cat='bat'
fi

if command -v zoxide >/dev/null 2>&1; then
    alias cd='z'
fi
