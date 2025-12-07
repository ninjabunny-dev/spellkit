#!/bin/bash

# Convert string to PascalCase (first letter of each word capitalized)
# Usage: ./to-pascal.sh "your string"

input_string="$1"

if [ -z "$input_string" ]; then
    echo "Usage: $0 \"string to convert\""
    exit 1
fi

clean_string=$(echo "$input_string" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9 ]//g' | sed 's/ \+/ /g' | sed 's/ /_/g')
echo "$clean_string" | sed 's/_\([a-z]\)/\U\1/g' | sed 's/^./\U&/'