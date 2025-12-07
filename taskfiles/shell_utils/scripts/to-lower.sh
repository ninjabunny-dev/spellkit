#!/bin/bash

# Convert string to lowercase
# Usage: ./to-lower.sh "your string"

input_string="$1"

if [ -z "$input_string" ]; then
    echo "Usage: $0 \"string to convert\""
    exit 1
fi

echo "$input_string" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9 ]//g' | tr ' ' '_'