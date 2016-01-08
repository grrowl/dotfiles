# symlink dotfiles
dir=~/dotfiles
olddir=~/dotfiles/bak   # backup directory
files=".zshrc .bashrc .vimrc .bash_logout .gitconfig .gemrc"    # list of files/folders to symlink in homedir

## create dotfiles_old in homedir
mkdir -p $olddir

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv -f ~/$file $olddir
    echo "Creating symlink to $file in ~"
    ln -s $dir/$file ~/$file
done
