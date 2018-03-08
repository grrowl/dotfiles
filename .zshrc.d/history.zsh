HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=25000

# ignore sequential duplicates
setopt hist_ignore_dups

setopt hist_reduce_blanks

# shared history across shells
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# list choices on ambiguous completion
# use BASH_AUTO_LIST to require a second keypress
setopt AUTO_LIST

# don't list on unambiguous prefix
setopt LIST_AMBIGUOUS

# share history between terminals
setopt share_history

# bind to zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

