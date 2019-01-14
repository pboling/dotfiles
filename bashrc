source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

# use .localrc for settings specific to one system
[[ -s "$HOME/.localrc" ]] && echo "Loading your .localrc, human" && source "$HOME/.localrc"

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
