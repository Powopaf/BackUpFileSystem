#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <text> <key>"
    exit 1
fi

file=$1
key=$2

ext=${file##*.}

if [[ "$ext" = "cesar" ]]; then
    echo "Decrypting..."
    echo "Running: python3 Encryption/cesar.py decrypt \"$file\" \"$key\""
    python3 Encryption/cesar.py decrypt "$file" "$key"
else
    echo "Encrypting..."
    echo "Running: python3 Encryption/cesar.py encrypt \"$file\" \"$key\""
    python3 Encryption/cesar.py encrypt "$file" "$key"
fi
