PS1="\[\e[1;32m\]\h:\W \u$\[\e[0m\] "

# cool aliases bro
alias start-ubuntu="'`locate vmrun`' -T fusion start ~/Documents/Virtual\ Machines.localized/Ubuntu\ Server.vmwarevm nogui && open smb://ubuntu/share"
alias restart-sound="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"
alias start-http='python -m SimpleHTTPServer'

alias git-fancy-log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative"
alias git-timesheet='git log --pretty=format:"%C(yellow)%h%Creset  %C(green)%ad%Creset  %C(cyan)%s" --author="`git config --get user.name`" --since='6am''

alias production='export RAILS_ENV=production && echo "Rails: $RAILS_ENV"'
alias development='export RAILS_ENV=development && echo "Rails: $RAILS_ENV"'

# some more ls aliases from ubuntu
eval `dircolors 2> /dev/null`
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# better back-searching
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ssh coloring
ssh() {
    if command ssh "$@"; then
    # reset iTerm session to Default
        echo -e "\033]50;SetProfile=Default\a"
    fi
}

if [ -d /usr/local/opt/android-sdk ]; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
fi

if [ -d ~/webdev ]; then
  cd /webdev
fi
