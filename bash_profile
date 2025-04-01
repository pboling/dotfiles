[[ -s "$HOME/.bashrc" ]] && echo "Loading .bashrc, human" && source "$HOME/.bashrc" # Load default .bashrc

[[ -s "$HOME/.profile" ]] && echo "Loading .profile, human" && source "$HOME/.profile" # Load default .profile

[[ -s "$HOME/.iterm2_shell_integration.bash" ]] && echo "Loading iTerm2 shell integration, human" && source "$HOME/.iterm2_shell_integration.bash" # Load iTerm2 shell integration

echo "Now, go be a bad ass."

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
