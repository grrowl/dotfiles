#!/bin/bash

function lazy_nvm {
  unset -f nvm
  unset -f npm
  unset -f node
  unset -f npx
  unset -f yarn

  if [ -d "${HOME}/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # linux
    [ -s "$(brew --prefix nvm)/nvm.sh" ] && source $(brew --prefix nvm)/nvm.sh # osx
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # nvm bash_completion
  fi
  # node-prototype-repl (node >13)
  if [[ -n "$(command -v node-prototype-repl)" ]]; then
    export NODE_REPL_EXTERNAL_MODULE=$(which node-prototype-repl)
  fi
}

# aliases
function nvm { lazy_nvm; nvm "$@"; }
function npm { lazy_nvm; npm "$@"; }
function node { lazy_nvm; node "$@"; }
function npx { lazy_nvm; npx "$@"; }
function yarn { lazy_nvm; yarn "$@"; }
