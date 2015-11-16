#!/bin/bash
# Update script that compares a repo pulled in vs what's in config
# this allows you to play through updates and rolls through semantic version
# releases so that you can do on-system deployment specific changes as well
# as have a history of what has been run and when.

# where am i? move to where I am. This ensures source is properly sourced
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

#provide messaging colors for output to console
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) #  green
bldred=${txtbld}$(tput setaf 1) #  red
txtreset=$(tput sgr0)
updateecho(){
  echo "${bldgrn}$1${txtreset}"
}
updatewarn(){
  echo "${bldred}$1${txtreset}"
}
# Define seconds timestamp
timestamp(){
  date +"%s"
}

# global config variables
CURRENT_VERSION = ''
SOURCE_VERSION = ''
UPDATE_HISTORY = ''
UPDATE_DIR = ''
# start the upgrade routine
updateecho "Starting update routine.."

# find source version

# find current version

# compare versions

# play through the updates

# update current version file

# update update history file

