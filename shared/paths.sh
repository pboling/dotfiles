HOME_BIN="$HOME/bin"
DOT_BIN="$HOME/.bin"
DOTLOCAL_BIN="$HOME/.local/bin"

# Add bin paths, in order of precedence
export PATH="$HOME_BIN:$DOT_BIN:$DOTLOCAL_BIN:$PATH"

# git & overcommit (enable on per project basis)
OVERCOMMIT_DISABLE=1

# Node
# Support SSL Cert from mkcert with NodeJS
# - https://zellwk.com/blog/serving-https-locally-with-node/
# brew install mkcert
# brew install nss # Required for Firefox
# mkcert -install
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Postgres.app Integration (for latest version)
#export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# homebrew postgres - old versions
# Restart: brew services restart postgresql@12
#export PATH="/opt/homebrew/Cellar/postgresql@12/12.9_1/bin:$PATH"

# asdf-postgres
# start: /Users/pboling/.asdf/installs/postgres/12.9/bin/pg_ctl -D /Users/pboling/.asdf/installs/postgres/12.9/data -l logfile start
#export PATH="/Users/pboling/.asdf/installs/postgres/12.9/bin:$PATH"

# brew install mysql#5.7 with openssl (keg-only, not in path)
# For compilers to find mysql@5.7 you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/mysql@5.7/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/mysql@5.7/include"
# bundle config build.mysql2 --with-ldflags=-L/opt/homebrew/opt/openssl@3/lib --with-cppflags=-I/opt/homebrew/opt/openssl@3/include
# Mysql: https://gist.github.com/operatino/392614486ce4421063b9dece4dfe6c21
# Restart: brew services restart mysql@5.7
#export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# PHP
#export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
#export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

# EC2 tools
if [[ -d $HOME/.ec2/tools ]]; then
  export EC2_HOME=$HOME/.ec2/tools
  # Add EC2 tools to path
  export PATH=$PATH:$EC2_HOME/bin
fi

# JX
[[ -d "$HOME/.jx/bin/" ]] && export PATH=$HOME/.jx/bin/:$PATH

# GNU tools
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# ES
# https://chartio.com/resources/tutorials/how-to-install-elasticsearch-on-mac-os-x/#manual-elasticsearch-installation
# export ES_HOME=~/src/elasticsearch-6.8.4
# export ES_HOME=~/src/elasticsearch-6.4.3
#export PATH=$ES_HOME/bin:$PATH

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### Krew (plugin manager for kubectl)
[[ -d "${KREW_ROOT:-$HOME/.krew}" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

### KUBECONFIG PATHS
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
