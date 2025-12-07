#!/bin/bash

# Convert string to UPPERCASE
# Usage: ./to-upper.sh "your string"

input_string="$1"

if [ -z "$input_string" ]; then
    echo "Usage: $0 \"string to convert\""
    exit 1
fi

echo "$input_string" | tr '[:lower:]' '[:upper:]' | sed 's/[^a-zA-Z0-9 ]//g' | tr ' ' '_'