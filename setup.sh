# symlink bash files (no delete)
echo "# Backing up files: if not removed, will be deleted."

if [[ ! -f ~/.bashrc ]]; then
  mv -i ~/.bashrc ~/.bashrc.bak;
  rm ~/.bashrc 2> /dev/null
fi
ln -s ~/dotfiles/.bashrc ~/.bashrc

if [[ ! -f ~/.bash_logout ]]; then
  mv -i ~/.bash_logout ~/.bash_logout.bak;
  rm ~/.bash_logout 2> /dev/null
fi
ln -s ~/dotfiles/.bash_logout ~/.bash_logout

if [[ ! -f ~/.gitconfig ]]; then
  mv -i ~/.gitconfig ~/.gitconfig.bak;
  rm ~/.gitconfig 2> /dev/null
fi
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

if [[ ! -f ~/.vimrc ]]; then
  mv -i ~/.vimrc ~/.vimrc.bak;
  rm ~/.vimrc 2> /dev/null
fi
ln -s ~/dotfiles/.vimrc ~/.vimrc
