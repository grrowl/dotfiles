# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function set-title {
  echo -ne "\033]0;"$*"\007"
}

function set-status {
  it2setkeylabel set status $*
}
