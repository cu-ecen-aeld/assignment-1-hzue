#!/bin/bash

set -e

filesdir=$1
searchstr=$2

log::error_exit () {
    echo "ERROR: ${1}"
    exit 1
}

[[ $filesdir = "" || $searchstr = "" ]] && log::error_exit "Both filesdir and searchstr have to be specified."

log::debug "$filesdir"
log::debug "$searchstr"

[ ! -d "$filesdir" ] && log::error_exit "filesdir is not a directory."

filescount="$(find "$filesdir" -type f | wc -l)"
linescount="$(grep -R "${searchstr}" "$filesdir" | wc -l)"

echo "The number of files are ${filescount} and the number of matching lines are ${linescount}"
