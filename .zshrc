# benchmark startup:
# zmodload zsh/zprof

# ensure /usr/local/bin is in path
export PATH=/usr/local/bin:~/.local/bin:$PATH

# Homebrew — load EARLY so brew's completions are on $fpath before compinit runs
# (zgen triggers compinit below; otherwise _zoxide & all brew completions get missed).
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# load all files from .shell/zshrc.d directory
if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*.zsh; do
    source $file
  done
fi

# load all files from .shell/rc.d directory
if [ -d $HOME/.rc.d ]; then
  for file in $HOME/.rc.d/*.sh; do
    source $file
  done
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='zed --wait'
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tom/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tom/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/completion.zsh.inc'; fi

# (brew shellenv moved to the top so completions load before compinit)

# bun completions
[ -s "/Users/tom/.bun/_bun" ] && source "/Users/tom/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init zsh)"; fi

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# opencode
[ -d "$HOME/.opencode/bin" ] && export PATH="$HOME/.opencode/bin:$PATH"

# LM Studio CLI (lms)
[ -d "$HOME/.lmstudio/bin" ] && export PATH="$PATH:$HOME/.lmstudio/bin"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tom/.lmstudio/bin"
# End of LM Studio CLI section

