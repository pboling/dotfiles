[[ -s "$HOME/.bashrc" ]] && echo "Loading .bashrc, human" && source "$HOME/.bashrc" # Load default .bashrc

[[ -s "$HOME/.profile" ]] && echo "Loading .profile, human" && source "$HOME/.profile" # Load default .profile

[[ -s "$HOME/.iterm2_shell_integration.bash" ]] && echo "Loading iTerm2 shell integration, human" && source "$HOME/.iterm2_shell_integration.bash" # Load iTerm2 shell integration

# rbenv setup ($PATH and shell completions)
eval "$(rbenv init -)"

echo "Now, go be a bad ass."