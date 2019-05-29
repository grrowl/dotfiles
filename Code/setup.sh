#!/bin/bash
set -e

TARGET="$HOME/Library/Application Support/Code/User"
SOURCE="$HOME/dotfiles/Code/User"
BAK="$HOME/dotfiles/bak/Code_User"

setup_symlink () {
  if [ -d "$TARGET" ]; then
    true
  else
    echo "$TARGET does not exist"
    exit 1
  fi

  if [ -f "$TARGET/$1" ]; then
    mv "$TARGET/$1" "$BAK/$1"
  fi

  ln -s "$SOURCE/$1" "$TARGET/$1"
}

setup_symlink "settings.json"
setup_symlink "keybindings.json"
