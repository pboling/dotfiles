# export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin

# Add bin paths, in order of precedence
export PATH="$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH"

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
if [[ -d $HOME/.ec2/tools ]]; then
  export EC2_HOME=$HOME/.ec2/tools
  # Add EC2 tools to path
  export PATH=$PATH:$EC2_HOME/bin
fi

# JX
[[ -d "/usr/local/opt/icu4c/bin" ]] && export PATH=$HOME/.jx/bin/:$PATH

if [[ -d $HOME/.ec2/tools ]]; then
  # brew install icu4c
  # Dependency of libxml2
  export PATH="/usr/local/opt/icu4c/bin:$PATH"
  export PATH="/usr/local/opt/icu4c/sbin:$PATH"
fi

# ES
# https://chartio.com/resources/tutorials/how-to-install-elasticsearch-on-mac-os-x/#manual-elasticsearch-installation
# export ES_HOME=~/src/elasticsearch-6.8.4
# export ES_HOME=~/src/elasticsearch-6.4.3
#export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# brew install libxml2
# bundle config build.libxml-ruby --with-xml2-config=/usr/local/opt/libxml2/bin/xml2-config --with-xml2-dir=/usr/local/opt/libxml2 --with-xml2-lib=/usr/local/opt/libxml2/lib --with-xml2-include=/usr/local/opt/libxml2/include
[[ -d "/usr/local/opt/libxml2/bin" ]] && export PATH="/usr/local/opt/libxml2/bin:$PATH"

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### Added by the Heroku Toolbelt
[[ -d "/usr/local/heroku/bin" ]] && export PATH="/usr/local/heroku/bin:$PATH"

### Krew (plugin manager for kubectl)
[[ -d "${KREW_ROOT:-$HOME/.krew}" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

### Istioctl Client Tool (installed via Homebrew)
[[ -d "$HOME/istio-1.15.0/bin" ]] && export PATH="$PATH:$HOME/istio-1.15.0/bin"
