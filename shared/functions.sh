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
