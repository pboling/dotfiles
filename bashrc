# Will wipe out any pre-existing PATH setting, so do this first!
source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/functions

# Setup Homebrew
[[ -s "$HOME/.shared/brew.sh" ]] && echo "Loading .shared/brew.sh, human" && source "$HOME/.shared/brew.sh"

# Sets up asdf, Depends on Homebrew
[[ -s "$HOME/.shared/bourne.sh" ]] && echo "Loading .shared/bourne.sh, human" && source "$HOME/.shared/bourne.sh"

source ~/.bash/completions

# JAVA
# Install Java: https://whichjdk.com/#adoptium-eclipse-temurin
# asdf plugin add java
# asdf list all java | grep -e "^temurin-\d"
# asdf install java temurin-17.0.5+8
# asdf global java temurin-17.0.5+8
[[ -f "$HOME/.asdf/plugins/java/set-java-home.bash" ]] && echo "Setting up Java, human" && source "$HOME/.asdf/plugins/java/set-java-home.bash"

source ~/.bash/config

# alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

# Hub! for Github integration with Git
#eval "$(hub alias -s)"

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

# direnv setup needs to be after prompt modifications
eval "$(direnv hook bash)"
