[ -z "$PS1" ] && return
HISTCONTROL=ignoredups:ignorespace

shopt -s histappend
shopt -s checkwinsize

HISTSIZE=5000
HISTFILESIZE=10000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# try really hard to get 256 color support
if [[ \$COLORTERM = gnome-* && \$TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ \$TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# run the previous command with sudo
alias please="sudo !!"

# serve
alias serve="python -m SimpleHTTPServer"

# ec2
source ~/.aws_keys

# debian maintainer
DEBEMAIL="ben.lemasurier@gmail.com"
DEBFULLNAME="Ben LeMasurier"
export DEBEMAIL DEBFULLNAME

# chef
export PATH="/opt/chef/embedded/bin:$PATH"
export OPSCODE_USER="ben___"

alias dev='ssh -X ben@ben-dev'
alias random_password='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c8 && echo'

export EDITOR=vim

# golang
export GOPATH=$HOME/code/go

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
