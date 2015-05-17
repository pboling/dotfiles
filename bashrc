source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load RVM into the shell first thing after the PATHs so it is available for the rest of the env setup
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.bash/config
