#!/bin/bash
ulimit -n 10000
# Check if target number is passed
if [ -z "$1" ]; then
    echo "❌ Usage: $0 <target_number>"
    exit 1
fi

target_number="$1"

# Run the program on each directory
for i in {1..6}; do
    dir="$HOME/split_files/dir$i"
    echo "🔍 Running search in $dir for target $target_number"
    ./script "$target_number" "$dir"
    echo "✅ Finished dir$i"
    echo "---------------------------"
done
