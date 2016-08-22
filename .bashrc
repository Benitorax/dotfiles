
# If not in interactive mode, don't do anything.
[[ "$-" != *i* ]] && return

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Add bash completion if exists
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# Command aliases
alias l='ls -lah --color=always --group-directories-first'
alias cdr='cd -P' # Runs "cd" with real paths instead of symlinked paths
alias ww='cdr ~/www'

# Git
alias gd='git diff'
alias gst='git status'
alias gl='git log'

# Symfony
alias sf='php bin/console'
alias sf2='php app/console'

# Bash prompt look & colors
PS1=''
PS1=$PS1'\[\033[0;32m\]' # Green
PS1=$PS1'\u'             # Username
PS1=$PS1'\[\e[0m\]'      # Reset color
PS1=$PS1' '
PS1=$PS1'\[\033[0;33m\]' # Brown/orange
PS1=$PS1'\w'             # Current directory
PS1=$PS1'\[\e[0m\]'      # Reset color
PS1=$PS1' '
if [ -f "/etc/bash_completion.d/git-prompt" ]
then
    # Git branch in bash if completion available
    source /etc/bash_completion.d/git-prompt
    PS1=$PS1'$(__git_ps1)\[\e[0m\] ' # Git branch in teal/light blue
fi
PS1=$PS1'$ ' # Final dollar sign and space
