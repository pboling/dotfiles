# gpg setup - allow password from terminal input
export GPG_TTY=$(tty)

# Allow write permissions as group (homebrewers or staff)
umask 0002

# Setup asdf version manager
export ASDF_HOME=$(brew --prefix asdf)
if [[ -f "$ASDF_HOME/libexec/asdf.sh" ]]; then
  source "$ASDF_HOME/libexec/asdf.sh"
  [[ -s "$HOME/.shared/asdf.sh" ]] && source "$HOME/.shared/asdf.sh"
fi

# Hub! for Github integration with Git
eval "$(hub alias -s)"

# git & overcommit (enable on per project basis)
export OVERCOMMIT_DISABLE=1

# use .localrc for settings specific to one system
[[ -f "$HOME/.localrc" ]] && source "$HOME/.localrc"

export LANG=en_US.UTF-8
