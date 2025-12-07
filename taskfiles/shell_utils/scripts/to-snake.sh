#!/bin/bash

# Convert string to snake case (lowercase with underscores)
# Usage: ./to-snake.sh "your string"

input_string="$1"

if [ -z "$input_string" ]; then
    echo "Usage: $0 \"string to convert\""
    exit 1
fi

echo "$input_string" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9 ]//g' | sed 's/ \+/ /g' | sed 's/ /_/g'