#!/bin/bash
mkdir five
for i in {1..5}
do
    mkdir "five/dir$i"
done
 
for dir in {1..5}; do
	   for file_num in {1..4}; do
	       for line in $(seq 1 $file_num); do
		   echo $file_num >> "five/dir$dir/file$file_num"
	       done
	   done
	done
   
