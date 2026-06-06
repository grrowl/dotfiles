#!/bin/bash

# symlink dotfiles
dir="$HOME/dotfiles"
olddir="$HOME/dotfiles/bak"   # backup directory
files=".zshrc .zshrc.d .rc.d .bashrc .vimrc .bash_logout .gitconfig .gitignore_global .gemrc .vim .tmux.conf"    # list of files/folders to symlink in homedir

## create dotfiles_old in homedir
mkdir -p $olddir

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    [ -e "$HOME/$file" ] && mv -f "$HOME/$file" $olddir
    echo "Creating symlink to $file in ~"
    ln -sfn "$dir/$file" "$HOME/$file"
done

# ── App settings ─────────────────────────────────────────────────────────────
# Symlink vetted, public-safe app configs from config/ into their real homes.
# (See .gitignore — config/ is ignored by default, these files are opted in.)
link_config() {   # link_config <repo-path> <abs-dest>
    local src="$dir/$1" dest="$2"
    [ -e "$src" ] || return 0
    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mkdir -p "$olddir/$(dirname "$1")"
        mv -f "$dest" "$olddir/$1"
    fi
    ln -sfn "$src" "$dest"
    echo "Linked $1 -> $dest"
}

link_config config/ghostty/config    "$HOME/.config/ghostty/config"
link_config config/zed/settings.json "$HOME/.config/zed/settings.json"
link_config config/zed/keymap.json   "$HOME/.config/zed/keymap.json"
link_config config/zed/tasks.json    "$HOME/.config/zed/tasks.json"

# Rectangle: prefs domain can't be symlinked — import the cleaned export instead.
if command -v defaults >/dev/null 2>&1 && [ -f "$dir/config/rectangle/import.sh" ]; then
    bash "$dir/config/rectangle/import.sh" || true
fi
