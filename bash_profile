if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
