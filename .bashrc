if [[ $- != *i* ]] ; then
  # shell is non-interactive. be done now!
  return
fi

if [ -d $HOME/.bashrc.d ]; then
  for file in $HOME/.bashrc.d/*.bash; do
    source $file
  done
fi

# load all files from .shell/rc.d directory
if [ -d $HOME/.rc.d ]; then
  for file in $HOME/.rc.d/*.sh; do
    source $file
  done
fi

# prompt
PS1="\[\e[1;32m\]\h:\W \u$\[\e[0m\] "

# better back-searching
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
