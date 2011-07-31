########################################################################################
# useful aliases
########################################################################################

# quickly reload or edit bash configuration file
alias reload="source ~/.bash_profile"
alias edprof='$EDITOR ~/.bash_profile'

# edit aliases
alias edalias='$EDITOR ~/.bash_profile.d/options.aliases.sh'

# quickly edit vimrc file
alias edvim='$EDITOR ~/.vimrc'

# quickly edit hosts file
alias edhosts='sudo $EDITOR /etc/hosts'

# quickly edit ssh config file
alias edsshconfig='$EDITOR ~/.ssh/config'

# quickly edit inputrc or hosts file
alias edinput='$EDITOR ~/.inputrc'

# filesystem shortcuts
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lah'
alias ls="ls -lahG"
alias zf=~/bin/zf.sh

# list directories
alias lsd='find . -type d'

# list all dotfiles in home directory
alias dotfiles='ls -d ~/.*'

# games
alias play-dunnet='emacs -batch -l dunnet'
