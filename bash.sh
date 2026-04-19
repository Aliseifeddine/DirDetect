#!/bin/bash

input_file="files.txt"
output_file="files_with_php_extension.txt"

# Clear output file if it exists
> "$output_file"

while IFS= read -r line || [ -n "$line" ]; do
  if [ -n "$line" ]; then
    echo "${line}.php" >> "$output_file"
  fi
done < "$input_file"
