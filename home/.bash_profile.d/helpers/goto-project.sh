######################################################################################## 
# function for jumping to project directories 
######################################################################################## 
 
function goto-project() { 
    local dir=~/Dropbox/Projects/$1 
 
    if [ ! -d $dir ]; then 
        echo "Project directory: '$dir' not found." 
    else 
        pushd $dir 
    fi 
}

