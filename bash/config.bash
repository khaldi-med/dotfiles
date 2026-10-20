# History settings
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
export HISTFILESIZE=200000
shopt -s histappend
# Save history after every command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Window settings
shopt -s checkwinsize

# Better directory navigation
shopt -s autocd 2>/dev/null
shopt -s globstar

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
fi

# Completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
