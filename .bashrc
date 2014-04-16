# is this shell interactive?
[ -z "$PS1" ] && return

export EDITOR=vim

alias cd..="cd .."
alias gvim="mvim"
alias random_password='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c8 && echo'
alias kl="kitchen list"

# run the previous command with sudo
alias please="sudo !!"

# serve
alias serve="python -m SimpleHTTPServer"

# paths
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export DOCKER_HOST=tcp://localhost:4243
export GOPATH=$HOME/code/go

# history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND='history -a'

# correctly wrap lines
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|linux|screen|SCREEN)
    export CLICOLOR=1

    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# color
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# try really hard to get 256 color support
if [[ \$COLORTERM = gnome-* && \$TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ \$TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

# common color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    $platform = `uname`
    if [[ $platform == 'linux' ]]; then
      alias ls='ls --color=auto'
    elif [[ $platform == 'Darwin' ]]; then
      alias ls='ls -G'
    fi

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    export GREP_OPTIONS="--color=always"
fi

# debian maintainer
DEBEMAIL="ben.lemasurier@gmail.com"
DEBFULLNAME="Ben LeMasurier"
export DEBEMAIL DEBFULLNAME
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# update all git repositories under the current directory
function pullall() {
  for i in `ls`; do pushd .; cd $i; git pull; popd; done;
}

# chef
#export PATH="/opt/chef/embedded/bin:$PATH"
#export OPSCODE_USER="ben___"
function chefdeps() {
  grep depends chef-*/metadata.rb | sed -E 's/[[:space:]]+/ /' | awk '{ printf "%s%s%s %s\n", $2, $3, $4, $1 }' | sort | column -t
}

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
