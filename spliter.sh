#!/bin/bash

# Set the path to the folder containing the PDF files
folder_path="$HOME/cnss/"
output_dir="$HOME/split_files/"

# Create output directories
mkdir -p "$output_dir/dir1"
mkdir -p "$output_dir/dir2"
mkdir -p "$output_dir/dir3"
mkdir -p "$output_dir/dir4"
mkdir -p "$output_dir/dir5"
mkdir -p "$output_dir/dir6"

# Get the list of all PDF files in the folder
pdf_files=($(find "$folder_path" -name "*.pdf"))

# Calculate the number of files to move to each directory
num_files=${#pdf_files[@]}
files_per_dir=$((num_files / 6))

# Split the files into 6 directories
for i in $(seq 0 5); do
    start_index=$((i * files_per_dir))
    end_index=$(((i + 1) * files_per_dir))

    # If it's the last directory, include any remaining files
    if [ "$i" -eq 5 ]; then
        end_index=$num_files
    fi

    # Move the files to the respective directory
    for j in $(seq $start_index $((end_index - 1))); do
        mv "${pdf_files[$j]}" "$output_dir/dir$((i + 1))/"
    done
done

echo "Files have been split into 6 directories."

