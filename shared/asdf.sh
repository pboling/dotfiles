# Setup Homebrew
[[ -s "$HOME/.shared/brew.sh" ]] && source "$HOME/.shared/brew.sh"

# Setup asdf version manager
ASDF_HOME=$(brew --prefix asdf)
[[ -f "$ASDF_HOME/asdf.sh" ]] && source "$ASDF_HOME/asdf.sh"
