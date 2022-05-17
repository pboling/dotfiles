# changing directory to code project
function ck { cd ~/Documents/GitHub/$1; }
function cban { cd ~/src/ButterBan; }
function cdot { cd ~/src/dotfiles; }
function ch { 
    local project="${1:-railsbling}"
    cd ~/src/hugo/$1; }
function co1 { cd ~/src/my/oauth-ruby; }
function co2 { cd ~/src/my/oauth2; }
function crubo { 
    local project="${1:-rubocop-lts}"
    cd ~/src/rubocop-lts/$1; }
function cr { 
    local project="${1:-api}"
    cd ~/src/rivi/$project; }
function cud {
    local project="${1:-api}"
    cd ~/src/uds/$project; }
function psqlsrv {
    local version="${1:-12.8}"
    local action="${2:-start}"
    ~/.asdf/installs/postgres/$1/bin/pg_ctl -D ~/.asdf/installs/postgres/$1/data -l logfile $2
}
function mongosrv {
    local version="${1:-3.2.9}"
    ~/.asdf/installs/mongodb/$1/bin/mongod --dbpath ~/.asdf/installs/mongodb/$1/data --port $2
}