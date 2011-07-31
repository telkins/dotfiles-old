###############################################################################
# Count lines of code in a [1:dir] or the current working directory.
###############################################################################

function lc { 
  dir=${1:-.} 
  awk='' 

  # Extensions
  exts=( bat c cpp h java rb rake module inc php py install js css haml sass sh erb )
  exts_pattern=`echo ${exts[*]} | tr " " "|"` 

  # AWK iteration
  for (( i = 0; i < ${#exts[*]}; i++ )); do
  awk=${awk}' /\.('${exts[$i]}')$/ { '${exts[$i]}'_total += $1 }'
  done

  # AWK print each total
  awk=${awk}' END {'
  for (( i = 0; i < ${#exts[*]}; i++ )); do
  awk=${awk}' printf "'${exts[$i]}' %d \\n", '${exts[$i]}'_total;'
  done

  # AWK print aggregated total
  awk=${awk}' total = '
  for (( i = 0; i < ${#exts[*]}; i++ )); do
  awk=${awk}${exts[$i]}'_total + '
  done
  
  # AWK close 
  awk=${awk}'0; printf "total %d \\n", total; }'

  echo -ne $(find "$dir" -type f | egrep '\.('"$exts_pattern"')$' | xargs wc -l | awk "$awk")
}

