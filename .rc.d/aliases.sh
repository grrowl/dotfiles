#!/bin/bash

# ls
alias l='ls -lFh'     # size,show type,human readable
alias la='ls -lAFh'   # long list,show almost all,show type,human readable
alias lr='ls -tRFh'   # sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
alias ll='ls -l'      # long list
alias lth='lt | head -16' # latest 15

alias dfh='df -h' # df

# export local .env file
alias export-env="export \$(grep -v '^#' .env | xargs -0)"

# docker
alias d='docker'
alias dc='docker compose'

# k8s
alias k='kubectl'
alias kx='kubectx'

# http
alias http-server='python -m SimpleHTTPServer'

# osx-only aliases
if [[ "$(uname -s)" = 'Darwin' ]]; then
  alias get-buffer="$HOME/dotfiles/bin/get-iterm2-buffer"
  alias chrome-tabs="$HOME/dotfiles/bin/chrome-tabs"
fi

# node
alias scripts="jq .scripts package.json"

# other bin
alias awsp="$HOME/dotfiles/bin/aws-profile"

# display docker statuses
alias dockerps="docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'"

# set terminal title
function title {
  echo -ne "\033]0;"$*"\007"
}

alias branchpr="git checkout -b fix/grrowl-\$(date +%s) && gh pr create -w"

# generate password
alias pwgen="openssl rand -base64"

alias rssi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | egrep -E 'agrCtlRSSI|agrCtlNoise|lastTxRate'"
