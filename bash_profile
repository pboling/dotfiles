if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
