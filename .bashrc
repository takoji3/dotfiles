export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=vim
export GIT_EDITOR=vim

alias ls='ls -G'
alias v='vim'
alias addbashrc="echo $1 >> $HOME/.bashrc"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $HOME/.nvm/nvm.sh
# use brew
#source $(brew --prefix nvm)/nvm.sh
#nvm use v5.3.0

# golang
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
alias updategopath='export GOPATH=$(pwd)'

# ghq + peco
alias ghqpecolscd='cd "$(ghq list --full-path | peco)"'
