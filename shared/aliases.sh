source ~/.shared/functions.sh

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# ping
alias sping="ping -i 2 -s 4"

# git
# https://github.com/defunkt/hub
alias git=hub
# and then shorten it: "g" for "git"
alias g='git'

# kubernetes
alias k=kubectl

# gch       => git checkout master
# gch bugs  => git checkout bugs
function gch {
    if [ -z "$1" ]; then
        git checkout master
    else
        git checkout $1
    fi
}
function grout {
    if [ -z "$1" ]; then
        echo "Please provide a filename to reset and checkout"
    else
        git checkout -- $1 && git reset HEAD $1
    fi
}
function gfist {
    if [ -z "$1" ]; then
        echo -e "To provide a remote other than origin to get a list of file changes against current HEAD use:\n\tgfist <remote-name>/<branch-name>"
        echo "running git diff origin/master head --stat"
        git diff origin/master head --stat
    else
        echo "running git diff $1 head --stat"
        git diff $1 head --stat
    fi
}
function gdist {
    if [ -z "$1" ]; then
        echo -e "To provide a remote other than origin to get a summary of directory changes against current HEAD use:\n\tgdist <remote-name>/<branch-name>"
        echo "running git diff origin/master head --dirstat"
        git diff origin/master head --dirstat
    else
        echo "running git diff $1 head --dirstat"
        git diff $1 head --dirstat
    fi
}
function isr {
    if [ -z "$1" ]; then
        echo -e "To ssh with screen into a remote server pass <user>@<IP>"
        echo "connecting... ssh -t $DEFAULT_SSH_OPTIONS $DEFAULT_SSH_TARGET screen $2"
        ssh -t $DEFAULT_SSH_OPTIONS $DEFAULT_SSH_TARGET screen $2
    else
        echo "connecting... ssh -t $DEFAULT_SSH_OPTIONS $1 screen $2"
        ssh -t $DEFAULT_SSH_OPTIONS $1 screen $2
    fi
}
function ish {
    if [ -z "$1" ]; then
        echo -e "To ssh into a remote server pass <user>@<IP>"
        echo "connecting... ssh -t $DEFAULT_SSH_OPTIONS $DEFAULT_SSH_TARGET"
        ssh -t $DEFAULT_SSH_OPTIONS $DEFAULT_SSH_TARGET
    else
        echo "connecting... ssh -t $DEFAULT_SSH_OPTIONS $1"
        ssh -t $DEFAULT_SSH_OPTIONS $1
    fi
}
function grabdef {
    if [ -z "$1" ]; then
        echo -e "To provide a default grab image format other than the default:\n\tgrabdef {gif,jpg,tiff,pdf,psd,png}"
        echo "running defaults write com.apple.screencapture type png && killall SystemUIServer"
        defaults write com.apple.screencapture type png && killall SystemUIServer
    else
        echo "defaults write com.apple.screencapture type $1 && killall SystemUIServer"
        defaults write com.apple.screencapture type $1 && killall SystemUIServer
    fi
}

alias gb='git branch'
alias gbr='git branch -a -v'
alias gbDA='git branch | egrep -v "\*|\s+(master|development|develop|staging|rc|quality)" | xargs git branch -D'
alias gad='git add'
alias gadd='git add .'
alias gap='git add --patch'
alias god='git add -A .'
alias gps='git push'
alias gpl='git pull'
alias glo='git log --pretty=format:"%Cgreen%h %Creset %s %Cblueby %an (%ar) %Cred %d" --graph'
alias gsh="git show \$1 --color"
alias gdf='git diff'
alias gdi='git diff --stat --color'
alias gdc='git diff --cached --stat --color'
alias gc='git commit -S'
alias gca='git commit -S -a'
alias gme='git commit -S -m'
alias gma='git commit -S -ma'
alias gst='git status'
alias gco='git checkout'
alias gout='git checkout --'
alias gra='git remote add'
alias grr='git remote rm'
alias gcl='git clone'
alias gres='git reset HEAD'
alias ghard='git reset --hard HEAD'
alias gsoft='git reset --soft HEAD'
alias gback='git reset --soft HEAD\^'
alias gash='git stash'
alias gashp='git stash pop'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gcl="git clean -d -f"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# git-svn
alias gsd='git svn dcommit'
alias gsl='git svn log'
alias gsf='git svn fetch'
alias gsr='git svn rebase'
alias gsfr='git svn fetch && git svn rebase'
alias gsfrp='god && git stash && git svn fetch && git svn rebase && git stash pop && gres'
alias shbase='god && git stash save \"stash during rebase\" && gsfr && git stash pop && gres'
alias gsl='git svn log'

# rails
alias tlog='tail -f log/development.log'
alias migrate='rake db:migrate db:test:clone'
alias plog='tail -f ~/Library/Logs/puma-dev.log'

# rails >= 3

# bundler
alias bin='bundle install'
alias biv='bundle install --path vendor'
alias bpk='bundle package'
alias bup='bundle update'
alias bec='bundle exec'
alias bspec='bundle exec rspec'
alias pspec='bundle exec parallel_rspec'
alias pspec2='TEST_ENV_NUMBER=2 bundle exec rspec'
alias pspec3='TEST_ENV_NUMBER=3 bundle exec rspec'
alias pspec4='TEST_ENV_NUMBER=4 bundle exec rspec'
alias pspec5='TEST_ENV_NUMBER=5 bundle exec rspec'
alias pspec6='TEST_ENV_NUMBER=6 bundle exec rspec'
alias pspec7='TEST_ENV_NUMBER=7 bundle exec rspec'
alias pspec8='TEST_ENV_NUMBER=8 bundle exec rspec'
alias vbspec='VCR_RECORD=all bundle exec rspec'
alias best='bundle exec rspec spec'
alias bex='bundle exec'
alias brake='bundle exec rake'
alias brlog='bundle exec rake log:clear'
alias brou='bundle exec rake routes'
alias brojs='bundle exec rake js:routes'
alias brc='bundle exec rails c'
alias brs='bundle exec rails s puma'
alias brsdfp='DISABLE_FORWARD_PROXY=true bundle exec rails s puma'
alias rdbdev='RACK_ENV=development brake db:reset'
alias rdbtest='RACK_ENV=test brake db:drop db:create db:schema:load'

# rspec
alias best='bundle exec rspec spec'

# Passenger
#alias rst='touch tmp/restart.txt'

# commands starting with % for pasting from web
alias %=' '

# utility
alias reload='source ~/.zshrc'
alias relias='source ~/.zsh/aliases'
alias reconf='source ~/.zsh/config'
alias recomp='source ~/.zsh/completion'

# ember
# alias shopping-client='ember serve --output-path "$HOME/Documents/trumaker/archer/public/shopping-client" --environment=ember-local'

# hugo
alias bling='hugo server --source ~/Documents/hugo/railsbling --buildDrafts --buildExpired --buildFuture --forceSyncStatic --watch --theme redlounge --destination ~/Documents/hugo/drafts'

# alternate dropbox:
alias dropalt='HOME=$HOME/.dropbox-alt /Applications/Dropbox.app/Contents/MacOS/Dropbox &'

# docker
# alias evdocker="eval $(docker-machine env default)"
