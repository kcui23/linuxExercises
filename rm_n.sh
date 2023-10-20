#!/bin/bash
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <dir> <n>
Where:
    <dir> is the directory to process
    <n> is the file size threshold in bytes. Files larger than this size will be deleted." 1>&2
    exit 1
fi
dir=$1
n=$2
find "$dir" -type f -size +"$n"c -exec rm {} \;
echo "Files larger than $n bytes in directory $dir have been removed."

