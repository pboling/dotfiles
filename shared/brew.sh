# homebrew
export HOMEBREW_PREFIX=$(brew --prefix)
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew";
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}";
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";

# brew install git
export PATH="${HOMEBREW_PREFIX}/opt/git/bin/:$PATH"

# Heroku Toolbelt
# brew tap heroku/brew && brew install heroku
[[ -d "${HOMEBREW_PREFIX}/heroku/bin" ]] && export PATH="${HOMEBREW_PREFIX}/heroku/bin:$PATH"

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

# homebrew postgres - old versions
# Restart: brew services restart postgresql@12
#export PATH="${HOMEBREW_PREFIX}/Cellar/postgresql@12/12.9_1/bin:$PATH"

# brew install mysql#5.7 with openssl (keg-only, not in path)
# For compilers to find mysql@5.7 you may need to set:
#  export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/mysql@5.7/lib"
#  export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/mysql@5.7/include"
# bundle config build.mysql2 --with-ldflags=-L${HOMEBREW_PREFIX}/opt/openssl@3/lib --with-cppflags=-I${HOMEBREW_PREFIX}/opt/openssl@3/include
# Mysql: https://gist.github.com/operatino/392614486ce4421063b9dece4dfe6c21
# Restart: brew services restart mysql@5.7
#export PATH="${HOMEBREW_PREFIX}/opt/mysql@5.7/bin:$PATH"

# PHP
#export PATH="${HOMEBREW_PREFIX}/opt/php@7.4/bin:$PATH"
#export PATH="${HOMEBREW_PREFIX}/opt/php@7.4/sbin:$PATH"
