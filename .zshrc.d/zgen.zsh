# guard against no zgen installed
if [ ! -d "${HOME}/.zgen" ]; then
  echo "zgen not installed"
  return
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  # completions
  zgen load zsh-users/zsh-completions src

  # bulk load
  zgen loadall <<EOPLUGINS
    mreinhardt/sfz-prompt.zsh
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
EOPLUGINS
  # ^ can't indent this EOPLUGINS

  # save all to init script
  zgen save
fi

# customise sfz-prompt
PROMPT_SFZ_CHAR="›"

prompt_sfz_colors () {
  case $1 in
    grey)     echo "{234}";;
    # used for pwd, light blue
    bgrey)    echo "{045}";;
    red)      echo "{126}";;
    bred)     echo "{200}";;
    green)    echo "{035}";;
    bgreen)   echo "{048}";;
    yellow)   echo "{148}";;
    byellow)  echo "{190}";;
    # used for prompt character, light grey
    blue)     echo "{250}";;
    bblue)    echo "{069}";;
    magenta)  echo "{092}";;
    bmagenta) echo "{099}";;
    cyan)     echo "{074}";;
    bcyan)    echo "{081}";;
    white)    echo "{153}";;
    bwhite)   echo "{195}";;
  esac
}

prompt_sfz_git_dirty() {
  # too expensive
}

# customise zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="underline"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="none"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# customise zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[unknown-token]='none'
ZSH_HIGHLIGHT_STYLES[path]='bold'

ZSH_HIGHLIGHT_STYLES[builtin]='fg=82'
ZSH_HIGHLIGHT_STYLES[command]='fg=121'
ZSH_HIGHLIGHT_STYLES[alias]='fg=193'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=white'
