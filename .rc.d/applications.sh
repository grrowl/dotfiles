#!/bin/bash

# nvm
if [ -d "${HOME}/.nvm" ]; then
#   see .rc.d/lazy-npm.sh
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # linux
#   [ -s "$(brew --prefix nvm)/nvm.sh" ] && source $(brew --prefix nvm)/nvm.sh # osx
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # nvm bash_completion
fi

# export golang bin path
if [ -d "$HOME/go" ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# node-prototype-repl (node >13)
if [[ -n "$(command -v node-prototype-repl)" ]]; then
  export NODE_REPL_EXTERNAL_MODULE=$(which node-prototype-repl)
fi
