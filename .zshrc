export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=vim
export GIT_EDITOR=vim
export LC_ALL=ja_JP.UTF-8

alias ls='ls -G'
alias v='vim'
alias vi='vim'
alias vim=$(brew --prefix vim)/bin/vim
alias gitbranchdelete='git branch | grep -v master | grep -v "*" | xargs git branch -d'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# ghq + peco
alias ghqpeco='cd "$(ghq list --full-path | peco)"'

export AWS_DEFAULT_PROFILE=default

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# laravel global
export PATH=$HOME/.composer/vendor/bin:$PATH

# set java env
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# for zsh
autoload -U compinit
compinit
PROMPT='%F{green}%~ %F{green}%#%n%f '
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt nonomatch
