###############################################################################
# Tab Completion Scripts
###############################################################################

### bash completion
if [ `which brew` &>/dev/null ] && [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi
### ssh connections (commented-out since bash completion handles this for us)
#complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

### svn
complete -W "add blame checkout commit copy delete diff list log revert status switch update" svn

### goto-project custom function
if [ -d ~/Dropbox/Projects ]; then
    complete -W "$(echo `find ~/Dropbox/Projects/ -maxdepth 1 | awk -F/ '{print $NF}' | grep -vP '(^[.])'`;)" goto-project
fi

