#!/bin/bash

# Function to calculate the mean of an array of numbers
calculate_mean() {
  local sum=0
  local count=0
  for value in "${@}"; do
    sum=$((sum + value))
    count=$((count + 1))
  done
  echo "scale=2; $sum / $count" | bc
}

# Check for the correct number of arguments
if [ $# -lt 1 ]; then
  echo "Usage: $0 <column> [file.csv]" >&2
  exit 1
fi

# Extract the column number from the first argument
column=$1

# Determine the data source: CSV file or stdin
if [ $# -eq 2 ]; then
  file="$2"
else
  file="/dev/stdin"
fi

# Use 'cut' to extract the specified column and 'tail' to skip the header
# Then store the column data in an array
column_data=($(cut -d ',' -f "$column" "$file" | tail -n +2))

# Check if the column is valid
if [ ${#column_data[@]} -eq 0 ]; then
  echo "Error: Invalid column number or empty data." >&2
  exit 1
fi

# Calculate the mean using the 'calculate_mean' function
mean=$(calculate_mean "${column_data[@]}")

# Print the result
echo "Mean of column $column: $mean"
