# Load RVM into the shell
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Fix for iTerm2 + rvm
# http://beginrescueend.com/integration/zsh/
__rvm_project_rvmrc
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
