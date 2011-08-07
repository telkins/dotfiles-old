########################################################################################
# environment variables
########################################################################################

# color library
. ~/.bash_profile.d/utils/colors.sh

# editor
export EDITOR=vim
export HGMERGE=vimdiff

# less -- EXAMPLE: "phpunit.xml.dist lines 1-29/61 byte 1099/2545 43%"
export LESS="--hilite-search --ignore-case --LONG-PROMPT --QUIET --HILITE-UNREAD --follow-name -PM ?f%f .?m(file %i of %m) .?ltlines %lt-%lb?L/%L. .byte %bB?s/%s. ?e(END) :?pB%pB\%..%t"

# zend server
export ZF_HOME=/usr/local/zend
export ZF_BIN=$ZF_HOME/bin
. /etc/zce.rc

# manual pages
export MANPATH=$MANPATH:/usr/local/man

# php (if we have brew installed, use it to find home directory, otherwise, locate the binary with which)
export PHP_HOME=$(which brew > /dev/null && brew --prefix php || which php | sed -e 's@/bin/php@@')
export PHP_BIN=$ZF_BIN/php

########################################################################################
# Set a large history in order to save a large number of commands to search.
########################################################################################

export HISTSIZE=1000000
export HISTFILESIZE=1000000000

########################################################################################
# path setup
########################################################################################

export HS=~/.homesick

# priority goes to project level ./bin, then $HOME/local/bin, then ...
#export PATH=./bin:~/local/bin:/usr/local/bin:/usr/local/sbin:$PATH

# add PHP to path
export PATH=$ZF_BIN:$PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ZF_HOME/lib

########################################################################################
# before each prompt run, execute the following to set the title-bar
# REF: http://hints.macworld.com/article.php?story=20031015173932306
########################################################################################
# NOTE: For this to work, you have to first, execute the following inside your project
# git config project.info.name Some_Cool_Project_Name

export PROMPT_COMMAND='echo -ne "\033]0;$(git config --get project.info.name || echo -ne "$USER@$HOSTNAME")\007"'

########################################################################################
# bash prompt / terminal customizations
########################################################################################

# this should get deleted at each sourcing of .bash_profile
PROMPT_CACHE_DIR=~/.prompt_cache.d
if [ -d $PROMPT_CACHE_DIR ]; then
    rm -Rf $PROMPT_CACHE_DIR
fi
mkdir -p $PROMPT_CACHE_DIR

# create the cached portions
if [ -x $PHP_BIN ]; then
    $PHP_BIN -v 2>&1|grep -i cli|cut -d' ' -f1-2    > "$PROMPT_CACHE_DIR/php.txt"
else
    touch "$PROMPT_CACHE_DIR/php.txt"
    echo "PHP (not installed)"                      > "$PROMPT_CACHE_DIR/php.txt"
fi

function set_prompt {
  local LIGHT_RED="\e[\033[1;31m\]"
  local LIGHT_GREEN="\e[\033[1;32m\]"
  local LIGHT_GRAY="\e[1;30m\]"
  local LIGHT_BLUE="\e[1;34m\]"
  local YELLOWISH="\e[\e[1;30m\]\e[1;33m\]"
  local NO_COLOUR="\e[\033[0m\]"

  local    PHPVER=$(cat "$PROMPT_CACHE_DIR/php.txt")
  local      TIME="\T"
  local SHELLINFO="\s \V"
  local   GITINFO="\$(__git_ps1)"

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM=auto
  export GIT_PS1_SHOWSTASHSTATE=true

  local  DEFAULT_PS1=$PS1
  #export PS1="$LIGHT_GRAY[ $LIGHT_BLUE$TIME $YELLOWISH\u@\H$LIGHT_BLUE \w/$LIGHT_GRAY ]\n"
  export PS1="$LIGHT_GRAY[ $LIGHT_BLUE$TIME $YELLOWISH\u$LIGHT_BLUE \w/$LIGHT_GRAY ]\n"
  export PS1="$PS1[ $LIGHT_RED$SHELLINFO, $PHPVER $LIGHT_GRAY ]"
  export PS1="$PS1$LIGHT_GREEN$GITINFO\n"
  export PS1=$PS1$DEFAULT_PS1
}

export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# call the "prompt" function
set_prompt

########################################################################################
# source all .sh files under the 'helpers' and 'options' directories
########################################################################################

for file in ~/.bash_profile.d/options/*.sh; do . $file; done
for file in ~/.bash_profile.d/helpers/*.sh; do . $file; done
for file in ~/.bash_profile.d/bash_completion/*.sh; do . $file; done

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
alias cdhs="cd $HS/repos/telkins/dotfiles"

# ...

alias l="ls -alO"
