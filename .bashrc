export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=vim
export GIT_EDITOR=vim

alias ls='ls -G'
alias v='vim'
alias addbashrc="echo $1 >> $HOME/.bashrc"
alias gitbranchdelete='gt branch | grep -v master | grep -v "*" | xargs git branch -d'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $HOME/.nvm/nvm.sh

export PATH=$HOME/bin:$PATH

# golang
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
alias updategopath='export GOPATH=$(pwd)'

# ghq + peco
alias ghqpecolscd='cd "$(ghq list --full-path | peco)"'

export AWS_DEFAULT_PROFILE=default
