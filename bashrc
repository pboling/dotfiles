source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

# use .localrc for settings specific to one system
[[ -s "$HOME/.localrc" ]] && source "$HOME/.localrc"

# Load RVM into the shell first thing after the PATHs so it is available for the rest of the env setup
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.bash/config

alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

# Hub! for Github integration with Git
eval "$(hub alias -s)"

# Python!
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#
# pyenv global system

# Fix for jruby + rvm
# https://stackoverflow.com/a/8371190/213191
chmod +x ${rvm_path}/hooks/after_use_jruby_opts
export JRUBY_OPTS=--1.9
