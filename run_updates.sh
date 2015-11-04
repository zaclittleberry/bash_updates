#!/bin/bash
update_source="current_update.sh"
source $update_source
echo "current version: "$current_version

source_dir="scripts"
file_type=".sh"

filter () {
  while read x ; do
    local IFS=" "
    #statements
    #echo $x
    prefix=$source_dir"/"
    suffix=$file_type
    cver=${current_version%$suffix}
    y=${x#$prefix}
    z=${y%$suffix}

    r=$(vercomp $z $cver)
    s=$?

    if [[ $s == 1 ]]
    then
      echo $x
      echo "current_version=\"$y\"" > $update_source
    fi

  done
}

#adapted from: http://stackoverflow.com/questions/4023830/bash-how-compare-two-strings-in-version-format
vercomp () {
  if [[ $1 == $2 ]]
  then
      return 0
  fi
  local IFS=.
  local i ver1=($1) ver2=($2)
  # fill empty fields in ver1 with zeros
  for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
  do
      ver1[i]=0
  done
  for ((i=0; i<${#ver1[@]}; i++))
  do
      if [[ -z ${ver2[i]} ]]
      then
          # fill empty fields in ver2 with zeros
          ver2[i]=0
      fi
      if ((10#${ver1[i]} > 10#${ver2[i]}))
      then
          return 1
      fi
      if ((10#${ver1[i]} < 10#${ver2[i]}))
      then
          return 2
      fi
  done
  return 0

}

runloop () {
  while read f ; do
    . $f
  done
}

find $source_dir -maxdepth 1 -type f | sort --version-sort | filter | runloop
