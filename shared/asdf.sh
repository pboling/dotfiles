# Setup Homebrew
[[ -s "$HOME/.shared/brew.sh" ]] && source "$HOME/.shared/brew.sh"

# Setup asdf version manager
export ASDF_HOME=$(brew --prefix asdf)
[[ -f "$ASDF_HOME/libexec/asdf.sh" ]] && source "$ASDF_HOME/libexec/asdf.sh"
