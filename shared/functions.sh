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
        exit 0
    else
        echo "No newline at end of file!"
        exit 1
    fi
}
function empty_newline_at_eof {
    if [[ -s "$1" && -z "$(tail -c 2 "$1")" ]]
    then
        echo "Empty newline at end of file!"
        exit 0
    else
        echo "No empty newline at end of file!"
        exit 1
    fi
}
function check_eof_newlines {
    # Finds files without final newlines
    # Pass "-f" to also fix those files
    #
    # Always have a new line marker at the end of every file comprised of text.
    # In a POSIX system a file missing a final new line is technically not a text file.
    # Some tools will not parse them, or parse them in unexpected ways.
    # NOTE: We'll forgive external files, in node_modules, and vendor.
    # See:
    #   Official POSIX Standard: https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_206
    #   Discussion of "why newline at EOF?": https://stackoverflow.com/q/729692/213191
    #   Primary Source: https://stackoverflow.com/a/67426395/213191
    #     Author: ppar, https://stackoverflow.com/users/9983387/ppar
    #   Documentation & theory behind `-not \( -path ... \)`: https://stackoverflow.com/a/69830768/213191
    #     Author: Gabriel Staples, https://stackoverflow.com/users/4561887/gabriel-staples
    #   License: CC BY-SA 4.0, https://creativecommons.org/licenses/by-sa/4.0/
    fix_flag="$([ "$1" == "-f" ] && echo -true || echo -false)"
    find . \
        -type f \
        -not \( -path "./node_modules" -prune \) \
        -not \( -path "./vendor" -prune \) \
        -exec sh -c 'file -b "{}" | grep -q text' \; \
        -exec sh -c '[ "$(tail -c 1 "{}" | od -An -a | tr -d "[:space:]")" != "nl" ]' \; \
        -print \
        $fix_flag \
        -exec sh -c 'echo >> "{}"' \;
}
function grm {
    git status | grep deleted | awk '{print \$3}' | xargs git rm
}
function gnuon {
  local gnu_packages=(
    coreutils
    findutils
    grep
    gnu-sed
    gnu-tar
  )
  local i
  for i in "${gnu_packages[@]}"; do
    if [[ -d "/usr/local/opt/${i}" ]]; then
      export PATH="/usr/local/opt/${i}/libexec/gnubin:$PATH"
      export MANPATH="/usr/local/opt/${i}/libexec/gnuman:$MANPATH"
    fi
  done
}
