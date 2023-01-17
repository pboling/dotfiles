. ~/.zsh/paths
. ~/.zsh/config
. ~/.zsh/aliases

# Setup Homebrew
[[ -s "$HOME/.shared/brew.sh" ]] && source "$HOME/.shared/brew.sh"

# Sets up asdf, Depends on Homebrew
[[ -s "$HOME/.shared/bourne.sh" ]] && source "$HOME/.shared/bourne.sh"

. ~/.zsh/completion

# JAVA
# Install Java: https://whichjdk.com/#adoptium-eclipse-temurin
# asdf plugin add java
# asdf list all java | grep -e "^temurin-\d"
# asdf install java temurin-17.0.5+8
# asdf global java temurin-17.0.5+8
[[ -s "$HOME/.asdf/plugins/java/set-java-home.zsh" ]] && echo "Setting up Java, human" && source "$HOME/.asdf/plugins/java/set-java-home.zsh"

# Autoload zsh vcs_info function (-U autoload w/o substition, -z use zsh style)
autoload -Uz vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:git:*' formats ' %s(%F{red}%b%f%u%c)' # git(main)

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

NEWLINE=$'\n'
TIME='[%F{yellow} %D{%Y-%m-%d %H:%M:%S.%.} %f] '
RUBY_VERSION="$(asdf current ruby | awk '{print $2}')"
PS1='%(?:%{\%}%F{green}➜$?➜%f :%{\%}%F{red}➜$?➜%f ) ${TIME} %F{cyan}%n@%m%f${NEWLINE}%F{white}%/%f$vcs_info_msg_0_ %F{magenta}ruby-${RUBY_VERSION}%f ${NEWLINE}$ '

# direnv setup
eval "$(direnv hook zsh)"
