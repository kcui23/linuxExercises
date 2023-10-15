#!/bin/bash
echo "The sum is "
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 | awk '{ total+=$1 } END { print total }' #find the sum
echo "The average is "
head Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 | awk '{ total+=$1 } END { print total/NR }' #find the average


