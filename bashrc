source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

[[ -s "$HOME/.shared/bourne.sh" ]] && echo "Loading .shared/bourne.sh, human" && source "$HOME/.shared/bourne.sh"

source ~/.bash/config

# Bash shell completions are for Bash only.
ASDF_HOME=$(brew --prefix asdf)
[[ -f "$ASDF_HOME/etc/bash_completions.d/asdf.bash" ]] && echo "Loading asdf bash shell completions, human" && source "$ASDF_HOME/etc/bash_completions.d/asdf.bash"

# alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

# Hub! for Github integration with Git
#eval "$(hub alias -s)"

# rbenv setup ($PATH and shell completions)
#eval "$(rbenv init -)"

# gpg setup - allow password from terminal input
# export GPG_TTY=$(tty)

# Python! https://github.com/pyenv/pyenv-installer#prerequisites
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# pyenv global system

# NPM & n
#export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"  # Added by n-install (see http://git.io/n-install-repo).

# Allow write permissions as group (homebrewers or staff)
#umask 0002

# lunchy gem for controlling postgres:
#   $ lunchy start postgres
#   $ lunchy stop postgres
# LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
# if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
#   . $LUNCHY_DIR/lunchy-completion.bash
# fi
