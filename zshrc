. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# Fix for iTerm2 + rvm
# http://beginrescueend.com/integration/zsh/
__rvm_project_rvmrc