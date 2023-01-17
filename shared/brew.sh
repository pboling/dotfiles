# homebrew
export HOMEBREW_PREFIX=$(brew --prefix)
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew";
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}";
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";

# git
export PATH="${HOMEBREW_PREFIX}/opt/git/bin/:$PATH"

# Stock libxml2 from MacOS seems to work now.
# brew install libxml2
# bundle config build.libxml-ruby --with-xml2-config=/usr/local/opt/libxml2/bin/xml2-config --with-xml2-dir=/usr/local/opt/libxml2 --with-xml2-lib=/usr/local/opt/libxml2/lib --with-xml2-include=/usr/local/opt/libxml2/include
# [[ -d "${HOMEBREW_PREFIX}/opt/libxml2/bin" ]] && export PATH="${HOMEBREW_PREFIX}/opt/libxml2/bin:$PATH"
# brew install icu4c
# Dependency of libxml2
#if [[ -d "${HOMEBREW_PREFIX}/opt/icu4c/bin" ]]; then
#  export PATH="${HOMEBREW_PREFIX}/opt/icu4c/bin:$PATH"
#  export PATH="${HOMEBREW_PREFIX}/opt/icu4c/sbin:$PATH"
#fi

# Heroku Toolbelt
# brew tap heroku/brew && brew install heroku
[[ -d "${HOMEBREW_PREFIX}/heroku/bin" ]] && export PATH="${HOMEBREW_PREFIX}/heroku/bin:$PATH"
