#!/bin/bash

if [[ $# -eq 2 ]]; then
    file=$2
    column=$1
elif [[ $# -eq 1 ]]; then
    file="/dev/stdin"
    column=$1
else
  echo "Usage: $0 <column> [filename]" 1>&2
  exit 1  
fi

cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read n;do
	sum=$(echo "scale=2; $sum+$n" | bc)
	count=$(($count+1));done
    average=$(echo "scale=2; $sum/$count" | bc)
    echo $average
}
