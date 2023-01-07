# gpg setup - allow password from terminal input
export GPG_TTY=$(tty)

# Allow write permissions as group (homebrewers or staff)
umask 0002

# Hub! for Github integration with Git
eval "$(hub alias -s)"

# rbenv setup ($PATH and shell completions)
#eval "$(rbenv init -)"

# use .localrc for settings specific to one system
[[ -f "$HOME/.localrc" ]] && source "$HOME/.localrc"
