#!/bin/bash

# nvm: see .rc.d/lazy-nvm.sh

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
