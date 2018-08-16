# ls
alias l='ls -lFh'     # size,show type,human readable
alias la='ls -lAFh'   # long list,show almost all,show type,human readable
alias lr='ls -tRFh'   # sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
alias ll='ls -l'      # long list

# http
alias start-http='python -m SimpleHTTPServer'

# osx-only aliases
if [[ "$(uname -s)" = 'Darwin' ]]; then
  alias get-buffer="$HOME/dotfiles/bin/get-iterm2-buffer"
  alias chrome-tabs="$HOME/dotfiles/bin/chrome-tabs"
fi

# display docker statuses
alias dockerps="docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'"
