export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting mise extract fzf eza zoxide)
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export SUDO_EDITOR=/usr/bin/nvim

# The following lines were added by compinstall
zstyle :compinstall filename '/home/guifersv/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
