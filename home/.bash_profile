########################################################################################
# environment variables
########################################################################################

# editor
export EDITOR=vim

# zend server
export ZF_HOME=/usr/local/zend
export ZF_BIN=$ZF_HOME/bin
. /etc/zce.rc

# manual pages
export MANPATH=$MANPATH:/usr/local/man

# php
#export PHP_HOME=`brew --prefix php`
export PHP_BIN=$ZF_BIN/php

########################################################################################
# path setup
########################################################################################

export PATH=$ZF_BIN:$PATH
#export PATH=$PATH:~/bin

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ZF_HOME/lib

########################################################################################
# bash prompt / terminal customizations
# NOTE: at some point, sprinkle some of this in: https://github.com/jimeh/git-aware-prompt
########################################################################################

# this should get deleted at each sourcing of .bash_profile
PROMPT_CACHE_DIR=~/.prompt_cache.d
if [ -d $PROMPT_CACHE_DIR ]; then
    rm -Rf $PROMPT_CACHE_DIR
fi

mkdir -p $PROMPT_CACHE_DIR
#compass version|head -n1                     >> "$PROMPT_CACHE_DIR/compass.txt"
$PHP_BIN -v 2>&1|grep -i cli|cut -d' ' -f1-2 >> "$PROMPT_CACHE_DIR/php.txt"
#~/.rvm/bin/rvm-prompt i v g                  >> "$PROMPT_CACHE_DIR/ruby.txt"
#python --version 2>&1|grep -i Python         >> "$PROMPT_CACHE_DIR/python.txt"
#scala -version 2>&1|cut -d' ' -f1,5          >> "$PROMPT_CACHE_DIR/scala.txt"
#node -v 2>&1                                 >> "$PROMPT_CACHE_DIR/nodejs.txt"

function prompt {
  local LIGHT_RED="\e[\033[1;31m\]"
  local LIGHT_GREEN="\e[\033[1;32m\]"
  local LIGHT_GRAY="\e[1;30m\]"
  local LIGHT_BLUE="\e[1;34m\]"
  local YELLOWISH="\e[\e[1;30m\]\e[1;33m\]"
  local NO_COLOUR="\e[\033[0m\]"

  local TITLEBAR='\[\033]0;\h\007\]'
  local TIME="\T"

  #local COMPASSVER=$(cat "$PROMPT_CACHE_DIR/compass.txt")
  local PHPVER=$(cat "$PROMPT_CACHE_DIR/php.txt")
  #local RUBYVER=$(cat "$PROMPT_CACHE_DIR/ruby.txt")
  #local PYTHONVER=$(cat "$PROMPT_CACHE_DIR/python.txt")
  #local SCALAVER=$(cat "$PROMPT_CACHE_DIR/scala.txt")
  #local NODEJSVER=$(cat "$PROMPT_CACHE_DIR/nodejs.txt")

  local GITINFO="\$(__git_ps1 ' (Git Project Branch: %s)')"

  #source ~/bin/.git-completion.bash

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM=auto
  export GIT_PS1_SHOWSTASHSTATE=true

#  export PS1="$TITLEBAR"
  #export PS1="$PS1$LIGHT_GRAY[ $LIGHT_BLUE$TIME $YELLOWISH\u@\H$LIGHT_BLUE \w/$LIGHT_GRAY ]\n"
#  export PS1="$PS1$LIGHT_GRAY[ $LIGHT_BLUE \w/$LIGHT_GRAY ]\n"
  #export PS1="$PS1[ $LIGHT_RED$RUBYVER, $COMPASSVER, $PHPVER, $NODEJSVER, $SCALAVER, $PYTHONVER$LIGHT_GRAY ]"
#  export PS1="$PS1[ $LIGHT_RED$PHPVER$LIGHT_GRAY ]"
  #export PS1="$PS1$LIGHT_GREEN$GITINFO\n"
#  export PS1="$PS1$LIGHT_GRAY[ $LIGHT_BLUE\s \V$LIGHT_GRAY ] $LIGHT_GREEN\$ "
}

export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# call the "prompt" function
#prompt

########################################################################################
# vi/vim options
########################################################################################

# set vi-style command line editing
set  -o vi
bind -m vi

########################################################################################
# aliases
########################################################################################

# quickly reload or edit bash configuration file
alias reload="source ~/.bash_profile"
alias edprof='$EDITOR ~/.bash_profile; reload'

# quickly edit vimrc file
alias edvim='$EDITOR ~/.vimrc'

# quickly edit hosts file
alias edhosts='sudo $EDITOR /etc/hosts'

# quickly edit inputrc file
alias edinput='$EDITOR ~/.inputrc'

# filesystem shortcuts
#alias cp='cp -i'
#alias mv='mv -i'
#alias ll='ls -a'
alias zf=$ZF_HOME/share/ZendFramework/bin/zf.sh

# list directories
alias ls="ls -G"
alias lsd='find . -type d'

# quickly go to fd workspace
alias cdfd="cd ~/Development/workspace/fd"

# To start/stop all Zend Server processes run:
alias zsstop="sudo $ZF_BIN/zendctl.sh stop"
alias zsstart="sudo $ZF_BIN/zendctl.sh start"
alias zsrestart="sudo $ZF_BIN/zendctl.sh restart"

# To start/stop Apache run:
alias apstop="sudo $ZF_BIN/zendctl.sh stop-apache"
alias apstart="sudo $ZF_BIN/zendctl.sh start-apache"
alias aprestart="sudo $ZF_BIN/zendctl.sh restart-apache"

# To start/stop MySQL run:
alias mystop="sudo $ZF_BIN/zendctl.sh stop-mysql"
alias mystart="sudo $ZF_BIN/zendctl.sh start-mysql"
alias myrestart="sudo $ZF_BIN/zendctl.sh restart-mysql"

# To see all options available for zendctl.sh run:
alias zcopts="sudo $ZF_BIN/zendctl.sh"

alias go64="sudo systemsetup -setkernelbootarchitecture x86_64"
alias go32="sudo systemsetup -setkernelbootarchitecture i386"
alias whichBit="uname -m"

# git
alias gs="git status"
alias gsets="git config --list"
alias gc="git commit"

# homesick
alias hslink="homesick symlink telkins/dotfiles"

# ...

alias l="ls -alO"
