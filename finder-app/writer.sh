#!/bin/bash

set -e

writefile=$1
writestr=$2

log::error_exit () {
    echo "ERROR: ${1}"
    exit 1
}

[[ $writefile = "" || $writestr = "" ]] && log::error_exit "Both writefile and writestr have to be specified."

mkdir -p "$(dirname "${writefile}")" || log::error_exit "Cannot create dirtory."
touch "$writefile" || log:error_exit "Cannot create file."

echo -n "$writestr" > "$writefile"
