#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <file-path> <template-file> [key=value ...]"
    exit 1
fi

FILE_PATH="$1"
TEMPLATE_FILE="$2"
shift 2

mkdir -p "$(dirname "$FILE_PATH")"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file '$TEMPLATE_FILE' not found"
    exit 1
fi

CONTENT=$(cat "$TEMPLATE_FILE")

while [[ $# -gt 0 ]]; do
    if [[ "$1" == *"="* ]]; then
        KEY="${1%%=*}"
        VALUE="${1#*=}"
        
        shift
        while [[ $# -gt 0 && "$1" != *"="* ]]; do
            VALUE="$VALUE $1"
            shift
        done
        
        CONTENT=$(echo "$CONTENT" | sed "s|{{$KEY}}|$VALUE|g")
    else
        shift
    fi
done

echo "$CONTENT" > "$FILE_PATH"

echo "Created file: $FILE_PATH"