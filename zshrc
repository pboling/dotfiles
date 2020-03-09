. ~/.zsh/paths
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

autoload -Uz compinit && compinit

# direnv setup
eval "$(direnv hook zsh)"

[[ -s "$HOME/.shared/bourne.sh" ]] && echo "Loading .shared/bourne.sh, human" && source "$HOME/.shared/bourne.sh"
