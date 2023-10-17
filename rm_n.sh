#!/bin/bash
if [[ $# -ne 2 ]]; then
    echo 2 inputs are needed: first one is dictionary, the second is the number of bytes 1>&2
    exit 1
fi
dir=$1
n=$2
find "$dir" -type f -size +"$n"c -exec rm {} \;
echo "Files larger than $n bytes in directory $dir have been removed."

