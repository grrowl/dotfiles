HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=25000

# TODO: see this gist <https://gist.github.com/matthewmccullough/787142>


# ignore duplicates (on find and on history file save)
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt hist_reduce_blanks

# shared chronological history in log
setopt INC_APPEND_HISTORY
# shared history across shells
# setopt share_history

# list choices on ambiguous completion
# use BASH_AUTO_LIST to require a second keypress
setopt AUTO_LIST

# don't list on unambiguous prefix
setopt LIST_AMBIGUOUS

# bind to zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ^R = pattern-enabled search
bindkey '^R' history-incremental-pattern-search-backward

