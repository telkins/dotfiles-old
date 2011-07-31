########################################################################################
# function for starting a new project based on a particular directory
########################################################################################

function project-init() { 
    local source=$1 
    local target=$2
 
    if [ ! -d $source ]; then 
        echo "source directory: '$source' not found." 
        exit 1
    fi 

    if [ -d $target ]; then 
        echo "target directory: '$target' already exists." 
        exit 1
    fi 
    
    # copy from source to destination excluding commonly excluded files (source control directories, etc.)
    rsync -avz --exclude '.git' --exclude '.svn' --exclude '.hg' $source/ $target/
}
