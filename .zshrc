# benchmark startup:
# zmodload zsh/zprof

# ensure /usr/local/bin is in path
export PATH=/usr/local/bin:~/.local/bin:$PATH

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
  export EDITOR='code --wait'
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tom/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tom/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f '/opt/homebrew/bin/brew' ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# bun completions
[ -s "/Users/tom/.bun/_bun" ] && source "/Users/tom/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init zsh)"; fi
