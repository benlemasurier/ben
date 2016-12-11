export XDG_CONFIG_HOME=~/.config

# rvm
if [[ -d "$HOME.rvm" ]]; then
    export PATH="$PATH:$HOME/.rvm/bin"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
