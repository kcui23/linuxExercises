#!/bin/bash

numbers=$(echo {1000..2000})
sum=0

for i in $numbers; do
  if [[ $i =~ ^[01]+$ ]]; then 
      sum=$(($sum + $i))
  fi
done
echo "The sum of the numbers between 1000 and 2000 (inclusive) having digits only from the set {0, 1} is $sum."
