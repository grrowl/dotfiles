#!/bin/bash

# symlink dotfiles
dir="$HOME/dotfiles"
olddir="$HOME/dotfiles/bak"   # backup directory
files=".zshrc .zshrc.d .rc.d .bashrc .vimrc .bash_logout .gitconfig .gitignore_global .gemrc"    # list of files/folders to symlink in homedir

## create dotfiles_old in homedir
mkdir -p $olddir

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv -f "$HOME/$file" $olddir
    echo "Creating symlink to $file in ~"
    ln -s "$dir/$file" "$HOME/$file"
done
