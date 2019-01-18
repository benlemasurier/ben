# is this shell interactive?
[ -z "$PS1" ] && return

# Prefer US English and UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# terminal configuration
source ~/.bash-terminal

# Make vim the default editor.
export EDITOR='vim';

# aliases
source ~/.bash-aliases

# history
export HISTSIZE=                 # unlimited
export HISTFILESIZE=             # unlimited
export HISTCONTROL='ignoreboth'; # omit duplicates, anything beginning with a space
shopt -s histappend              # append to history instead of overwriting it
# after each command, append to history and re-read it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# paths
export CODE=$HOME/code/
export PATH=$PATH:/usr/local/protoc/bin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/packer

# completion
source ~/.bash-completion

# less syntax highlighting (requires source-highlight)
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
# export LESS='-R '

# development environment
if [ -f "$HOME/.bash-development" ]; then
    source "$HOME/.bash-development"
fi

# work environment
if [ -f "$HOME/.doenv" ]; then
        source "$HOME/.doenv"
fi

# secrets
if [ -f "$HOME/.bash_secrets" ]; then
        source "$HOME/.bash_secrets"
fi

# misc
export MANPAGER='less -X'; # don't clear after quitting `man`
