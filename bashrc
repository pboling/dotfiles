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




alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

export PATH="$HOME/.bin:$PATH"

eval "$(hub alias -s)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

source /usr/local/share/chruby/chruby.sh

source /usr/local/share/chruby/auto.sh

chruby ruby-2.4.2