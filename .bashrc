# is this shell interactive?
[ -z "$PS1" ] && return

# let's try this neovim out
alias vim=nvim

export EDITOR=vim

alias lod="echo 'ಠ_ಠ' | pbcopy"
alias cd..="cd .."
alias random_password='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c8 && echo'
alias kl="kitchen list"
alias kli="kitchen login"
alias kc="kitchen converge"
alias kd="kitchen destroy"
alias drm='docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a)'
alias dl='docker logs'
alias agi='apt-get install'
if [ -f /etc/debian_version ]; then
    alias ack='ack-grep'
    alias node='nodejs'
fi

# always forward ssh key
alias ssh="ssh -A"

# run the previous command with sudo
alias please="sudo !!"

# spin up a http server
alias serve="python -m SimpleHTTPServer"

# paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/packer
export DOCKER_HOST=tcp://localhost:4243
export CODE=$HOME/code/

# go
export GOPATH=$HOME/code/go
export GOHOME=$GOPATH/src/github.com/benlemasurier
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Make vim the default editor.
export EDITOR='vim';

# Increase Bash history size. Default is 500.
export HISTSIZE='131072';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
alias grep='grep --color=auto';

# correctly wrap lines
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|linux|screen|SCREEN)
    export CLICOLOR=1

    PS1="[\u@\h \W]\$ "
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

unset color_prompt force_color_prompt

# try really hard to get 256 color support
if [[ \$COLORTERM = gnome-* && \$TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ \$TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

# common color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    $platform = `uname`
    if [[ $platform == 'Linux' ]]; then
      alias ls='ls --color=auto'
    elif [[ $platform == 'Darwin' ]]; then
      alias ls='ls -G'
    fi

    alias grep='grep --color=auto'
fi

# debian maintainer
DEBEMAIL="ben.lemasurier@gmail.com"
DEBFULLNAME="Ben LeMasurier"
export DEBEMAIL DEBFULLNAME
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion $_quilt_complete_opt dquilt

# update all git repositories under the current directory
function pullall() {
  for i in `ls`; do pushd .; cd $i; git pull; popd; done;
}

# chef
function chefdeps() {
  grep depends chef-*/metadata.rb | sed -E 's/[[:space:]]+/ /' | awk '{ printf "%s%s%s %s\n", $2, $3, $4, $1 }' | sort | column -t
}

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
source ~/.git-completion

export DOCKER_HOST="unix:///var/run/docker.sock"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# work environment
if [ -f $HOME/.doenv ]; then
        source $HOME/.doenv
fi

# secrets
if [ -f $HOME/.bash_secrets ]; then
        source $HOME/.bash_secrets
fi
