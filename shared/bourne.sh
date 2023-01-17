# gpg setup - allow password from terminal input
export GPG_TTY=$(tty)

# Allow write permissions as group (homebrewers or staff)
umask 0002

# Setup asdf version manager
export ASDF_HOME=$(brew --prefix asdf)
[[ -f "$ASDF_HOME/libexec/asdf.sh" ]] && source "$ASDF_HOME/libexec/asdf.sh"

# JAVA
# Install Java: https://whichjdk.com/#adoptium-eclipse-temurin
# asdf plugin add java
# asdf list all java | grep -e "^temurin-\d"
# asdf install java temurin-17.0.5+8
# asdf global java temurin-17.0.5+8
[[ -f "$HOME/.asdf/plugins/java/set-java-home.bash" ]] && source "$HOME/.asdf/plugins/java/set-java-home.bash"

# Hub! for Github integration with Git
eval "$(hub alias -s)"

# rbenv setup ($PATH and shell completions)
#eval "$(rbenv init -)"

# use .localrc for settings specific to one system
[[ -f "$HOME/.localrc" ]] && source "$HOME/.localrc"

export LANG=en_US.UTF-8
