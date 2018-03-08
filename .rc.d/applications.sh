# nvm
if [ -d "${HOME}/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
fi

# export golang bin path
if [ -d "$HOME/go/bin" ]; then
  export PATH=$PATH:$HOME/go/bin
fi

# thefuck
command -v thefuck 1>/dev/null && eval "$(thefuck --alias)"

# rbenv
command -v rbenv 1>/dev/null && eval "$(rbenv init -)"

# brew
command -v brew 1>/dev/null && export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
