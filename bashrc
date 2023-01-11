# Will wipe out any pre-existing PATH setting, so do this first!
source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions

# Setup Homebrew
[[ -s "$HOME/.shared/brew.sh" ]] && source "$HOME/.shared/brew.sh"

# Setup asdf version manager
export ASDF_HOME=$(brew --prefix asdf)
[[ -f "$ASDF_HOME/libexec/asdf.sh" ]] && source "$ASDF_HOME/libexec/asdf.sh"

# Set Java Home before setting paths
[[ -f "$HOME/.asdf/plugins/java/set-java-home.bash" ]] && source "$HOME/.asdf/plugins/java/set-java-home.bash"

[[ -s "$HOME/.shared/bourne.sh" ]] && source "$HOME/.shared/bourne.sh"

source ~/.bash/config

# alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

# Hub! for Github integration with Git
#eval "$(hub alias -s)"

# rbenv setup ($PATH and shell completions)
#eval "$(rbenv init -)"

# gpg setup - allow password from terminal input
export GPG_TTY=$(tty)

# Python! https://github.com/pyenv/pyenv-installer#prerequisites
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# pyenv global system

# NPM & n
#export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"  # Added by n-install (see http://git.io/n-install-repo).

# lunchy gem for controlling postgres:
#   $ lunchy start postgres
#   $ lunchy stop postgres
# LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
# if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
#   . $LUNCHY_DIR/lunchy-completion.bash
# fi

# TODO: Test this out later for bash prompt PS1
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kube-ps1
# source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
# PS1='[\u@\h \W $(kube_ps1)]\$ '
