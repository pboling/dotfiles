. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# Heroku's Postgres.app
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"