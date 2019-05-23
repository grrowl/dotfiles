#!/bin/bash

set -e

ENSUREDIR="$HOME/.config/karabiner"
TARGET="$HOME/.config/karabiner/karabiner.json"
SOURCE="$HOME/dotfiles/karabiner/karabiner.json"
BAK="$HOME/dotfiles/bak/karabiner.json"

if [ -d "$ENSUREDIR" ]; then
  true
else
  echo "$ENSUREDIR does not exist"
  exit 1
fi

if [ -f "$TARGET" ]; then
  mv "$TARGET" "$BAK"
fi

ln -s "$SOURCE" "$TARGET"
