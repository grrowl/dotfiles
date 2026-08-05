#!/bin/bash

# SSH agent forwarding status.
#
# Sourced by both bash and zsh (see .bashrc / .zshrc), so keep this POSIX-ish.
#
# `ssh-agent-status` prints a one-line summary and can be run by hand any time.
# It also runs automatically when you land on an interactive SSH login, so a
# missing forward is obvious immediately rather than at the first git push.
#
# A missing forward is dim rather than red: it is usually deliberate, and the
# line is there to tell you which mode you are in, not to report a fault.
#
# A missing forward is almost always a client-side omission: the machine you
# connected FROM needs `ForwardAgent yes` for this host in its ~/.ssh/config.
# Fix it there, not here.

ssh-agent-status() {
  local reset='\033[0m' dim='\033[2m' grey='\033[90m'
  local green='\033[0;32m' yellow='\033[0;33m' red='\033[0;31m'
  # Not `status`: that is a read-only builtin in zsh and assigning to it
  # aborts the function on every zsh login.
  local keys rc count

  if [ -z "$SSH_AUTH_SOCK" ]; then
    printf "${dim}${grey}- ssh agent not forwarded (SSH_AUTH_SOCK is unset)${reset}\n"
    return 1
  fi

  # Keep the assignment and the status check separate: `local keys=$(...)`
  # would return the status of `local`, not of ssh-add.
  keys=$(ssh-add -l 2>/dev/null)
  rc=$?

  case $rc in
    0)
      # Counted in-shell rather than piping through wc and tr. This runs on
      # every SSH login, and those are two processes spawned to count at most a
      # handful of lines.
      count=0
      while IFS= read -r _; do count=$((count + 1)); done <<EOF
$keys
EOF
      printf "${green}+ ssh agent forwarded${reset} ${dim}(%s keys)${reset}\n" "$count"
      ;;
    1)
      printf "${yellow}! ssh agent forwarded but holds no keys${reset}\n"
      return 1
      ;;
    *)
      printf "${red}x ssh agent socket is dead${reset} ${dim}(%s)${reset}\n" "$SSH_AUTH_SOCK"
      return 1
      ;;
  esac
}

# Report on interactive SSH logins only. .zshrc sources .rc.d for
# non-interactive shells too, so without this guard the banner would be written
# into the stream used by scp, rsync and git-over-ssh and corrupt them.
#
# Local shells never reach the function at all, so this costs a local terminal
# nothing: $- and SSH_CONNECTION are both shell builtins.
case $- in
  *i*)
    if [ -n "$SSH_CONNECTION" ] && [ -t 1 ]; then
      ssh-agent-status || true
    fi
    ;;
esac
