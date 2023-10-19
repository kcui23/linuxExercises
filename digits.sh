#!/bin/bash

numbers=$(echo {1000..2000})
sum=0

for i in $numbers; do
  if [[ $i =~ ^[01]+$ ]]; then 
      sum=$(($sum + $i))
  fi
done
echo $sum
