# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# http
alias start-http='python -m SimpleHTTPServer'

# osx-only aliases
if [[ "$(uname -s)" = 'Darwin' ]]; then
  alias get-buffer="$HOME/dotfiles/bin/get-iterm2-buffer"
  alias chrome-tabs="$HOME/dotfiles/bin/chrome-tabs"
fi
