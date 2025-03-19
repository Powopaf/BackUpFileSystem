#!/bin/bash

PYTHON_SCRIPT="/usr/local/share/cesar/cesar.py"

if [[ ! -f "$PYTHON_SCRIPT" ]]; then
    echo "Error: cesar.py not found! in $PYTHON_SCRIPT" >&2
    exit 1
fi

if [[ $# -lt 2 ]]; then
    echo "Usage: cesar <encrypt/decrypt> <text> <key>"
    exit 1
fi

file=$1
key=$2

ext=${file##*.}

if [[ "$ext" = "cesar" ]]; then
    echo "Decrypting..."
    echo "Running: python3 Encryption/cesar.py decrypt \"$file\" \"$key\""
    python3 "$PYTHON_SCRIPT" decrypt "$file" "$key"
else
    echo "Encrypting..."
    echo "Running: python3 Encryption/cesar.py encrypt \"$file\" \"$key\""
    python3 "$PYTHON_SCRIPT" encrypt "$file" "$key"
fi
