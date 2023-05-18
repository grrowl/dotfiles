#!/bin/bash

# ls
alias l='ls -lFh'     # size,show type,human readable
alias la='ls -lAFh'   # long list,show almost all,show type,human readable
alias lr='ls -tRFh'   # sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
alias ll='ls -l'      # long list
alias lth='lt | head -16' # latest 15

alias dfh='df -h' # df

# du
alias duh="du -sh * | sort -h"

# export local .env file
alias export-env="export \$(grep -v '^#' .env | xargs -0)"

# docker / podman
if [ -f '/usr/bin/podman' ] || [ -f '/opt/homebrew/bin/podman' ]; then
  alias docker='podman'
  alias docker-compose='podman-compose'
  alias dc='docker-compose'
else
  alias dc='docker compose'
fi
alias d='docker'

# k8s
alias k='kubectl'
alias kx='kubectx'

# http
alias http-server='python3 -m http.server'

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

# dtach
dtach-job() {
  if [ -z $2 ]; then
    dtach -a $1.dtach
  else
    dtach -n $1.dtach /bin/bash -c "${@:2} >> $1.log 2>&1"
  fi
}

# better watch
alias watchx="watch -cd -n 2"

# easy checkout
checkout() {
  if [ -z "$*" ]; then
    echo "Needs arg"
    return
  fi

  DIR=$(echo "$@" | grep -Eo '[^/:]+/[^/]+\.git' | sed 's/\.git$//');
  git clone "$@" "$HOME/repos/$DIR" || return
  cd "$HOME/repos/$DIR" || return
}
