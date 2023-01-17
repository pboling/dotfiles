# Add bin paths, in order of precedence
HOME_BIN="$HOME/bin"
DOT_BIN="$HOME/.bin"
DOTLOCAL_BIN="$HOME/.local/bin"

# Add bin paths, in order of precedence
export PATH="$HOME_BIN:$DOT_BIN:$DOTLOCAL_BIN:$PATH"

# Node
# Support SSL Cert from mkcert with NodeJS
# export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Postgres.app Integration (for latest version)
# export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# brew install mysql#5.7
# bundle config build.mysql2 --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include
# Mysql: https://gist.github.com/operatino/392614486ce4421063b9dece4dfe6c21
# It seems mysql is being added to the PATH somewhere else.
# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Add man paths
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# EC2 tools
if [[ -d "$HOME/.ec2/tools" ]]; then
  export EC2_HOME=$HOME/.ec2/tools
  # Add EC2 tools to path
  export PATH=$PATH:$EC2_HOME/bin
fi

# JX
[[ -d "$HOME/.jx/bin/" ]] && export PATH=$HOME/.jx/bin/:$PATH

# ES
# https://chartio.com/resources/tutorials/how-to-install-elasticsearch-on-mac-os-x/#manual-elasticsearch-installation
# export ES_HOME=~/src/elasticsearch-6.8.4
# export ES_HOME=~/src/elasticsearch-6.4.3
#export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### Krew (plugin manager for kubectl)
[[ -d "${KREW_ROOT:-$HOME/.krew}" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
