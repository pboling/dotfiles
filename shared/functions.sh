# changing directory to code project
function ck { cd ~/Documents/GitHub/$1; }
function cban { cd ~/src/ButterBan; }
function cdot { cd ~/src/dotfiles; }
function ch { 
    local project="${1:-railsbling}"
    cd ~/src/hugo/$project; }
function co1 { cd ~/src/my/oauth-ruby; }
function co2 { cd ~/src/my/oauth2; }
function crubo { 
    local project="${1:-rubocop-lts}"
    cd ~/src/rubocop-lts/$project; }
function cr { 
    local project="${1:-api}"
    cd ~/src/rivi/$project; }
function cud {
    local project="${1:-api}"
    cd ~/src/uds/$project; }
function psqlsrv {
    local version="${1:-14.5}"
    local action="${2:-start}"
    mkdir -p ~/.asdf/installs/postgres/$version/data
    ~/.asdf/installs/postgres/$version/bin/pg_ctl -D ~/.asdf/installs/postgres/$version/data -l logfile $action
}
function mongosrv {
    local version="${1:-4.2.9}"
    local port="${2:-27017}"
    mkdir -p ~/.asdf/installs/mongodb/$version/data
    ~/.asdf/installs/mongodb/$version/bin/mongod --dbpath ~/.asdf/installs/mongodb/$version/data --port $port
}
function elasticsrv {
    local version="${1:-6.8.21}"
    mkdir -p ~/.asdf/installs/elasticsearch/$version/data
    ~/.asdf/installs/elasticsearch/$version/bin/elasticsearch
}
function newline_at_eof {
    if [[ -s "$1" && -z "$(tail -c 1 "$1")" ]]
    then
        echo "Newline at end of file!"
    else
        echo "No newline at end of file!"
    fi
}