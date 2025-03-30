#!/bin/bash

# Replaces all occurrences of a string in file contents, file names, and directory names.
# Usage: ./rename.sh <search_string> <replacement_string>

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <search_string> <replacement_string>"
  exit 1
fi

SEARCH="$1"
REPLACE="$2"
ROOT_DIR="."

echo "Replacing '$SEARCH' with '$REPLACE' in file contents..."
grep -rl --exclude-dir=".git" "$SEARCH" "$ROOT_DIR" | while read -r file; do
  sed -i '' "s/${SEARCH}/${REPLACE}/g" "$file"
done

echo "Renaming files..."
find "$ROOT_DIR" -depth -type f -name "*$SEARCH*" | while read -r file; do
  new_file="$(dirname "$file")/$(basename "$file" | sed "s/${SEARCH}/${REPLACE}/g")"
  mv "$file" "$new_file"
done

echo "Renaming directories..."
find "$ROOT_DIR" -depth -type d -name "*$SEARCH*" | while read -r dir; do
  new_dir="$(dirname "$dir")/$(basename "$dir" | sed "s/${SEARCH}/${REPLACE}/g")"
  mv "$dir" "$new_dir"
done

echo "Done replacing '$SEARCH' with '$REPLACE'."
