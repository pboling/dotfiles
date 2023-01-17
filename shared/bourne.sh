# Hub! for Github integration with Git
eval "$(hub alias -s)"

# gpg setup - allow password from terminal input
export GPG_TTY=$(tty)

# Allow write permissions as group (homebrewers or staff)
umask 0002

# Setup asdf version manager
export ASDF_HOME=$(brew --prefix asdf)
[[ -f "$ASDF_HOME/libexec/asdf.sh" ]] && source "$ASDF_HOME/libexec/asdf.sh"

# rbenv setup ($PATH and shell completions)
#eval "$(rbenv init -)"

# use .localrc for settings specific to one system
[[ -f "$HOME/.localrc" ]] && echo "Loading your .localrc, human" && source "$HOME/.localrc"
