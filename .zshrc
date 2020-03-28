# benchmark startup:
# zmodload zsh/zprof

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
  export EDITOR='code'
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tom/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tom/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/completion.zsh.inc'; fi

# zprof
