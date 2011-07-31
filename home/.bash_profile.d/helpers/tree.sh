###############################################################################
# Display a recursive tree structure of the [1:dir] or the current working directory.
###############################################################################

function tree() {
    local dir=${1:-'.'}
    if [[ -d $dir ]]; then
        find $dir -print | sed -e 's;[^/]*/;|___;g;s;___|; |;g'
    fi
}
