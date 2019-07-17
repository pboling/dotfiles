. ~/.zsh/paths
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

export PATH="$PATH:$HOME/.jx/bin/"

# rbenv setup ($PATH and shell completions)
eval "$(rbenv init -)"