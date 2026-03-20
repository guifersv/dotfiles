# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/guifersv/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=nvim
export SUDO_EDITOR=nvim
export VISUAL_EDITOR=nvim
export TERM=foot

alias n='nvim'
alias t='tmux'
alias md='mkdir -p'
alias rd='rmdir'
alias ..='cd ..'
alias ...='cd ../..'

alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gl='git pull'
alias gsw='git switch'
alias gp='git push --verbose'
alias gst='git status'
alias gcl='git clone --recurse-submodules'
alias gc='git commit --verbose'
