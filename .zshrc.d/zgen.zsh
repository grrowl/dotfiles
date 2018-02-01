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
