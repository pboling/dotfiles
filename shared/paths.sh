HOME_BIN="$HOME/bin"
DOT_BIN="$HOME/.bin"
DOTLOCAL_BIN="$HOME/.local/bin"

# Add bin paths, in order of precedence
export PATH="$HOME_BIN:$DOT_BIN:$DOTLOCAL_BIN:$PATH"

# Node
# Support SSL Cert from mkcert with NodeJS
# - https://zellwk.com/blog/serving-https-locally-with-node/
# brew install mkcert
# brew install nss # Required for Firefox
# mkcert -install
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Postgres.app Integration (for latest version)
#export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# EC2 tools
if [[ -d $HOME/.ec2/tools ]]; then
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
#export PATH=$ES_HOME/bin:$PATH

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### Krew (plugin manager for kubectl)
[[ -d "${KREW_ROOT:-$HOME/.krew}" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

### KUBECONFIG PATHS
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
