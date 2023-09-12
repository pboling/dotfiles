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
function git_add_all {
  # Read the config file at ~/.dvcs.yml
  local config_file_path="${HOME}/.dvcs.json"
  { local config_file=$(<"$config_file_path"); } 2>/dev/null
  if [ "${config_file}" = "" ] ; then
    echo "Create a config file at ${config_file_path}"
    return
  else
    echo "Found config file at ${config_file_path}"
  fi

jq '.name'

return
  # List out the git remotes, find the one called origin, and grab the git URL of it.
  local git_origin=$(git remote -v | grep origin | grep fetch | cut -w -f2)
  # Find the User or Org, works with a git URL like sourcehut, gitlab, github, or codeberg
  local account_name=$(echo "${git_origin}" | cut -d : -f2 | cut -d / -f1)
  # Now account is something like pboling (or ~pboling) , or rubocop-lts
  local project_name=$(echo "${git_origin}" | cut -d : -f2 | cut -d / -f2 | cut -d . -f1)

  # Prepare to template each DVCS
  declare -a PREFIXES
  PREFIXES=(
      "git@git.sr.ht"
      "git@gitlab.com"
      "git@codeberg.org"
      "git@github.com"
  )
  declare -r PREFIXES

  declare -a SUFFIXES
  SUFFIXES=(
      ""
      ".git"
      ".git"
      ".git"
  )
  declare -r SUFFIXES

  echo "git_origin is: ${git_origin}"
  echo "account_name is: ${account_name}"
  echo "project_name is: ${project_name}"

  # First we add the origin to "all"
  local push_remote="${ssh_login}:${ACCOUNT}/${PROJECT}${extension}";
  # These won't be used again for this loop, so unset them before we loop again.
  echo "🤨 Checking if ${git_origin} is already a push target for 'all'"
  local origin_added=$(git remote -v | grep all | grep push | cut -w -f2)
  if [ "${git_origin}" = "${origin_added}" ] ; then
    echo "✅ Discovered ${origin_added} as existing push target for 'all' remote"
  else
    echo "⚙️ Adding origin to all"
    #  git remote add all "${git_origin}"
  fi

  # 0 = sourcehut
  # 1 = gitlab
  # 2 = codeberg
  # 3 = github
  local iter=(1 2 3 4)
  for x in $iter;
  do
    # Figure out which one is the existing origin
    local ssh_login="${PREFIXES[x]}"
    local extension="${SUFFIXES[x]}"
    local host="${ssh_login##*@}"
    echo -e "\n💎💎💎 Analyzing Host: ${host} 💎💎💎"
    local to_add="${ssh_login}:${account_name}/${project_name}${extension}";
    if [ "${to_add}" = "${git_origin}" ]
    then
      echo "⏲️ Will add origin as 'all' push target at the end: ${to_add}";
      continue;
    fi

    local DEFAULT="y"

    # Verify the account name
    local ACCOUNT='';
    vared -p "*️⃣ Enter Account/User/Org Name for ${host} [default is '${account_name}', Y/q]: " -c ACCOUNT
    # adopt the default, if 'enter' given
    ACCOUNT="${ACCOUNT:-${account_name}}"
    # change to lower case to simplify following if
    lowered_account="${ACCOUNT:l}"
    # condition for specific letter
    if [ "${lowered_account}" = "q" ] ; then
      echo "Quitting"
      exit
    elif [ "${lowered_account}" = "y" ] ; then
      ACCOUNT="${account_name}"
    fi

    # Verify the project name
    local PROJECT='';
    vared -p "Enter Project Name for ${host} [default is '${project_name}', Y/q]: " -c PROJECT
    # adopt the default, if 'enter' given
    PROJECT="${PROJECT:-${project_name}}"
    # change to lower case to simplify following if
    lowered_answer="${PROJECT:l}"
    # condition for specific letter
    if [ "${lowered_answer}" = "q" ] ; then
      echo "Quitting"
      exit
    elif [ "${lowered_answer}" = "y" ] ; then
      PROJECT="${project_name}"
    fi

    # Put it all together and add it
    local push_remote="${ssh_login}:${ACCOUNT}/${PROJECT}${extension}";
    # These won't be used again for this loop, so unset them before we loop again.
    echo "🤨 Checking if ${push_remote} is already a push target"
    local existing=$(git remote -v | grep all | grep push | cut -w -f2)
    if [ "${push_remote}" = "${existing}" ] ; then
      echo "✅ Discovered ${existing} as existing push target for 'all' remote"
      continue;
    fi
    echo "⚙️ Adding ${push_remote} to 'all' remote"
#    git remote set-url --add --push all "${push_remote}

    echo -e "💎💎💎 Finished Host: ${host} 💎💎💎\n"
  done

  # Last we add the origin back to "all" as a push target, because it was removed by setting the other push targets.
  echo "⚙️ OK, time to add back the origin as push target for 'all'"
  #  git remote set-url --add --push all "${git_origin}"

  #git@git.sr.ht:~galtzo/rubocop-lts-meta
  #git@gitlab.com:rubocop-lts/meta.git
  #git@codeberg.org:rubocop-lts/meta.git
  #git@github.com:rubocop-lts/meta.git
}
