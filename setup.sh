# symlink dotfiles
SCRIPT_PATH=`realpath $0`
dotfiles=`dirname $SCRIPT_PATH`
olddir=~/dotfiles_old   # backup directory


files=".bashrc .vimrc .bash_logout .gitconfig"    # list of files/folders to symlink in homedir

## create dotfiles_old in homedir
echo "Creating $olddir for backup"
mkdir -p $olddir
cd $dotfiles

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv -f ~/$file $olddir
    echo "Creating symlink to $file in ~"
    ln -s $dir/$file ~/$file
done
