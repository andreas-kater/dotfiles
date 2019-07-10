#!/bin/sh

set -e
set -o pipefail

if [[ -d $1 ]]; then
    zip -er "${1}" "${1}" -P "$2"
elif [[ -f $1 ]]; then
    mkdir ${1%%.*}
    cp ${1} ${1%%.*} 
    zip -er "${1%%.*}" "${1%%.*}" -P "$2"
else
    echo "${1} is neither a file nor a directory"
    exit 1
fi
echo "done"


