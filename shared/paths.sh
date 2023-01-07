# export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin

# Add bin paths, in order of precedence
export PATH="$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH"

# git & overcommit (enable on per project basis)
OVERCOMMIT_DISABLE=1

# Node
# Support SSL Cert from mkcert with NodeJS
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# git
export PATH="/opt/homebrew/opt/git/bin/:$PATH"

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

# Java!

# EC2 tools
export EC2_HOME=$HOME/.ec2/tools

# Add EC2 tools to path
export PATH=$PATH:$EC2_HOME/bin

# JX
#export PATH=$HOME/.jx/bin/:$PATH

export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"

# ES
# https://chartio.com/resources/tutorials/how-to-install-elasticsearch-on-mac-os-x/#manual-elasticsearch-installation
# export ES_HOME=~/src/elasticsearch-6.8.4
# export ES_HOME=~/src/elasticsearch-6.4.3

export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# Trying stock MacOS libxml2, so commenting this out.
# brew install libxml2
# bundle config build.libxml-ruby --with-xml2-config=/opt/homebrew/opt/libxml2/bin/xml2-config --with-xml2-dir=/opt/homebrew/opt/libxml2 --with-xml2-lib=/opt/homebrew/opt/libxml2/lib --with-xml2-include=/opt/homebrew/opt/libxml2/include
# export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Krew (plugin manager for kubectl)
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

### KUBECONFIG PATHS
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config

### Istioctl Client Tool (installed via Homebrew)
export PATH="$PATH:/Users/pboling/istio-1.15.0/bin"
