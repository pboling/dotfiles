[[ -s "$HOME/.bashrc" ]] && echo "Loading your .bashrc, human" && source "$HOME/.bashrc" # Load the default .bashrc

# Fix for jruby and >= rvm 1.29.7
# https://stackoverflow.com/a/8371190/213191
chmod +x $HOME/.rvm/hooks/after_use_jruby_opts
export JRUBY_OPTS=--1.9

# Load RVM into the shell first thing after the PATHs so it is available for the rest of the env setup
[[ -s "$HOME/.rvm/scripts/rvm" ]] && echo "Loading your .rvm scripts, human" && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s "$HOME/.profile" ]] && echo "Loading your .profile, human" && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.iterm2_shell_integration.bash" ]] && echo "Loading your iterm2 shell integration, human" && source "$HOME/.iterm2_shell_integration.bash" # Load iTerm2 integration

echo "Now, go be a bad ass."