#!/usr/bin/env bash

#
# First source this script from bashrc
#
#   [[ -s "$HOME/.bash/ps1_functions.sh" ]] &&
#      source ~/.bash/ps1_functions.sh
#
# Then in order to set your prompt you simply do the following for example
#
# Examples:
#
#   ps1_set --prompt ∫
#
#   or
#
#   ps1_set --prompt ∴
#
# This will yield a prompt like the following, for example,
#
# 18:39:56 pboling@myjam:~/Documents/GitHub/foobar (git:pboling/138-push-changes:ecd65ea)  |ruby-2.6.3|
# ∴

# TODO: Update for asdf
#RBENV_THEME_PROMPT_PREFIX='|\[\033[0;33m\]'
#RBENV_THEME_PROMPT_SUFFIX='\[\033[0m\]|'

# TODO: Update for asdf
rbenv_version_prompt()
{
#  if rbenv local &> /dev/null; then
#    rubyv=$(rbenv local) || return
#    echo -e "$RBENV_THEME_PROMPT_PREFIX$rubyv$RBENV_THEME_PROMPT_SUFFIX"
#  elif which rbenv &> /dev/null; then
#    rubyv=$(rbenv global) || return
#    echo -e "$RBENV_THEME_PROMPT_PREFIX$rubyv$RBENV_THEME_PROMPT_SUFFIX"
#  fi
echo -e "ruby"
}

ps1_titlebar()
{
  case $TERM in
    (xterm*|rxvt*)
      printf "%s" "\033]0;\\u@\\h: \W\\007"
      ;;
  esac
}

ps1_identity()
{
  if (( $UID == 0 )) ; then
    printf "%s" "\[\033[31m\]\\u\[\033[0m\]@\[\033[36m\]\\h\[\033[35m\]:\w\[\033[0m\] "
  else
    printf "%s" "\[\033[32m\]\\u\[\033[0m\]@\[\033[36m\]\\h\[\033[35m\]:\w\[\033[0m\] "
  fi
}

ps1_git()
{
  local branch="" sha1="" line="" attr="" color=0

  shopt -s extglob # Important, for our nice matchers :)

  command -v git >/dev/null 2>&1 || {
    printf " \033[1;37m\033[41m[git not found]\033[m "
    return 0
  }

  branch=$(git symbolic-ref -q HEAD 2>/dev/null) || return 0 # Not in git repo.
  branch=${branch##refs/heads/}

  # Now we display the branch.
  sha1=$(git rev-parse --short --quiet HEAD)

  case "${branch:-"(no branch)"}" in
   production|prod) attr="1;37m\033[" ; color=41 ;; # red
   master|deploy)   color=31                     ;; # red
   stage|staging)   color=33                     ;; # yellow
   dev|develop|development) color=34             ;; # blue
   next)            color=36                     ;; # gray
   *)
     if [[ -n "${branch}" ]] ; then # Feature Branch :)
       color=32 # green
     else
       color=0 # reset
     fi
     ;;
  esac

  [[ $color -gt 0 ]] &&
    printf "\[\033[${attr}${color}m\](git:${branch}$(ps1_git_status):$sha1)\[\033[0m\] "
}

ps1_git_status()
{
  local git_status="$(git status 2>/dev/null)"

  [[ "${git_status}" = *deleted* ]]                    && printf "%s" "-"
  [[ "${git_status}" = *Untracked[[:space:]]files:* ]] && printf "%s" "+"
  [[ "${git_status}" = *modified:* ]]                  && printf "%s" "*"
}

# TODO: Update for asdf
ps1_rbenv()
{
  command -v rbenv_version_prompt >/dev/null 2>&1 && printf "%s" " $(rbenv_version_prompt) "
}

ps1_update()
{
  local prompt_char='$' separator="\n" notime=0

  (( $UID == 0 )) && prompt_char='#'

  while [[ $# -gt 0 ]] ; do
    local token="$1" ; shift

    case "$token" in
      --trace)
        export PS4="+ \${BASH_SOURCE##} : \${FUNCNAME[0]:+\${FUNCNAME[0]}()}  \${LINENO} > "
        set -o xtrace
        ;;
      --prompt)
        prompt_char="$1"
        shift
        ;;
      --noseparator)
        separator=""
        ;;
      --separator)
        separator="$1"
        shift
        ;;
      --notime)
        notime=1
        ;;
      *)
        true # Ignore everything else.
        ;;
    esac
  done

  if (( notime > 0 )) ; then
    PS1="$(ps1_titlebar)$(ps1_identity)$(ps1_git)$(ps1_rbenv)${separator}${prompt_char} "
  else
    PS1="$(ps1_titlebar)\D{%H:%M:%S} $(ps1_identity)$(ps1_git)$(ps1_rbenv)${separator}${prompt_char} "
  fi
}

ps2_set()
{
  PS2="  \[\033[0;40m\]\[\033[0;33m\]> \[\033[1;37m\]\[\033[1m\]"
}

ps4_set()
{
  export PS4="+ \${BASH_SOURCE##} : \${FUNCNAME[0]:+\${FUNCNAME[0]}()}  \${LINENO} > "
}

# WARNING:  This clobbers your PROMPT_COMMAND so if you need to write your own, call
#           ps1_update within your PROMPT_COMMAND with the same arguments you pass
#           to ps1_set
#
# The PROMPT_COMMAND is used to help the prompt work if the separator is not a new line.
# In the event that the separator is not a new line, the prompt line may become distorted if
# you add or delete a certain number of characters, making the string wider than the
# $COLUMNS + len(your_input_line).
#
# This orginally was done with callbacks within the PS1 to add in things like the git
# commit, but this results in the PS1 being of an unknown width which results in the prompt
# being distorted if you add or remove a certain number of characters. To work around this
# it now uses the PROMPT_COMMAND callback to re-set the PS1 with a known width of characters
# each time a new command is entered. See PROMPT_COMMAND for more details.
#
ps1_set()
{
  PROMPT_COMMAND="ps1_update $@"
}
