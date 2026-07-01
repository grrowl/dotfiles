#!/bin/bash

# ls
alias l='ls -lFh'     # size,show type,human readable
alias la='ls -lAFh'   # long list,show almost all,show type,human readable
alias lr='ls -tRFh'   # sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
alias ll='ls -l'      # long list
alias lth='lt | head -16' # latest 15

alias dfh='df -h' # df

# du
alias duh="du -sh * | sort -h"

# export local .env file
alias export-env="export \$(grep -v '^#' .env | xargs -0)"

# docker / podman — only alias to podman if docker CLI isn't installed
if ! command -v docker >/dev/null 2>&1 && command -v podman >/dev/null 2>&1; then
  alias docker='podman'
  alias docker-compose='podman-compose'
  alias dc='docker-compose'
else
  alias dc='docker compose'
fi
alias d='docker'

# k8s
alias k='kubectl'
alias kx='kubectx'

# http
alias http-server='python3 -m http.server'

# osx-only aliases
if [[ "$(uname -s)" = 'Darwin' ]]; then
  alias get-buffer="$HOME/dotfiles/bin/get-iterm2-buffer"
  alias chrome-tabs="$HOME/dotfiles/bin/chrome-tabs"
fi

# node
alias scripts="jq .scripts package.json"

# other bin
alias awsp="$HOME/dotfiles/bin/aws-profile"

# display docker statuses
alias dockerps="docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'"

# set terminal title
function title {
  echo -ne "\033]0;"$*"\007"
}

alias branchpr="git checkout -b fix/grrowl-\$(date +%s) && gh pr create -w"

# generate password
alias pwgen="openssl rand -base64"

alias rssi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | egrep -E 'agrCtlRSSI|agrCtlNoise|lastTxRate'"

# dtach
dtach-job() {
  if [ -z $2 ]; then
    dtach -a $1.dtach
  else
    dtach -n $1.dtach /bin/bash -c "${@:2} >> $1.log 2>&1"
  fi
}

# better watch
alias watchx="watch -cd -n 2"

# easy checkout
checkout() {
  if [ -z "$*" ]; then
    echo "Needs arg"
    return
  fi

  DIR=$(echo "$@" | grep -Eo '[^/:]+/[^/]+\.git' | sed 's/\.git$//');
  git clone "$@" "$HOME/repos/$DIR" || return
  cd "$HOME/repos/$DIR" || return
}

alias ac='git diff --staged | head -c $((128 * 1024 * 3)) | llm -m openrouter/openrouter/free '\''Write a concise, imperative-mood git commit message summarizing these changes. Begin with feat, fix, bug, docs, or chore. No preamble or yapping.'\'' | git commit -F -'

alias pbjson="pbpaste | jq -r"
alias pbjsons="pbpaste | jq -sRr '@json'"

alias vscode-server="docker run -it --init -p 3000:3000 -v "$(pwd):/home/workspace:cached" gitpod/openvscode-server"

alias cc='claude --dangerously-skip-permissions --system-prompt "."'
alias ccw='claude --dangerously-skip-permissions --system-prompt "." --tmux -w'

# gw — create a git worktree under .claude/worktrees/<name>, copy in the
#      .worktreeinclude (gitignored) files, cd into it, and print its path.
#      Git's chatter goes to stderr so stdout is just the path, e.g:
#          zed "$(gw new-feature)"
#   usage: gw <name> [base-ref]   (base-ref defaults to HEAD)
gw() {
  local repo name wt
  repo=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "gw: not in a git repo" >&2; return 1; }
  name=$1
  [ -n "$name" ] || { echo "usage: gw <name> [base-ref]" >&2; return 1; }
  wt="$repo/.claude/worktrees/$name"
  [ -e "$wt" ] && { echo "gw: $wt already exists" >&2; return 1; }

  git -C "$repo" worktree add -b "worktree-$name" "$wt" "${2:-HEAD}" >&2 || return

  # replicate .worktreeinclude: copy gitignored files matching its patterns
  if [ -f "$repo/.worktreeinclude" ]; then
    git -C "$repo" ls-files -z --others --ignored --exclude-from=.worktreeinclude \
      | while IFS= read -r -d '' f; do
          mkdir -p "$(dirname "$wt/$f")"
          cp -p "$repo/$f" "$wt/$f"
        done
  fi

  echo "$wt"
  cd "$wt"
}

alias t-claude="tmux has-session -t claude-session || tmux new-session -d -s claude-session; tmux attach-session -t claude-session"
alias t-code="tmux has-session -t code-session || tmux new-session -d -s code-session; tmux attach-session -t code-session"

# tt — attach/create the tmux session for the CURRENT dir, matching Zed's naming
# (parent_current via -A). Switches instead of nesting when already inside tmux.
tt() {
  local name
  name="$(basename "$(dirname "$PWD")")_$(basename "$PWD")"
  if [ -n "$TMUX" ]; then
    tmux has-session -t "=$name" 2>/dev/null || tmux new-session -d -s "$name"
    tmux switch-client -t "=$name"
  else
    tmux new-session -A -s "$name"
  fi
}

# tmux picker: native choose-tree (real tree, '/' filter, live preview, -Z zoom).
# -F colorizes the right-hand descriptive column — the session/window NAME on the
# left is drawn plain by tmux and can't be styled. Three line types handled via
# the pane_format / window_format conditional (else-branch = session line).
ts() {
  local h="$HOME" pane win sess fmt
  pane="#[fg=magenta]#{pane_current_command}#[default] #[fg=blue]#{s|$h|~|:pane_current_path}#[default]"
  win="#[fg=magenta]#{pane_current_command}#[default]  #[fg=blue]#{s|$h|~|:pane_current_path}#[default]#{?window_zoomed_flag, #[fg=yellow]Z#[default],}#{?window_active, #[fg=green]●#[default],}  #[fg=colour244]#{t/f/%b %d %H#:%M:window_activity}#[default]"
  sess="#[fg=yellow]#{session_windows}w#[default]  #{?session_attached,#[fg=green]● attached#[default],#[fg=colour244]detached#[default]}  #[fg=colour244]#{t/f/%b %d %H#:%M:session_activity}#[default]"
  fmt="#{?pane_format,$pane,#{?window_format,$win,$sess}}"
  if [ -n "$TMUX" ]; then
    tmux choose-tree -Zs -F "$fmt"
  else
    tmux attach \; choose-tree -Zs -F "$fmt" 2>/dev/null || echo "no tmux sessions"
  fi
}

# rerun <cmd...> — re-run a command whenever files under the cwd change, using
# whichever file watcher is installed (watchexec preferred, else entr). Lets the
# same alias work across machines that have one or the other.
if command -v watchexec >/dev/null 2>&1; then
  rerun() { watchexec --restart -- "$@"; }
elif command -v entr >/dev/null 2>&1; then
  # entr takes the file list on stdin; feed it everything under cwd minus .git
  rerun() { find . -type f -not -path '*/.git/*' | entr -r -- "$@"; }
else
  rerun() { echo "rerun: install watchexec or entr" >&2; return 127; }
fi
