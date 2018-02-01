# guard against no zgen installed
if [ ! -d "${HOME}/.zgen" ]; then
  echo "zgen not installed"
  return
fi


# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Saving zgen config"

  # bulk load
  zgen loadall <<EOPLUGINS
    mreinhardt/sfz-prompt.zsh
EOPLUGINS
  # ^ can't indent this EOPLUGINS

  # completions
  zgen load zsh-users/zsh-completions src

  # save all to init script
  zgen save
fi

# customise sfz-prompt color palette
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

