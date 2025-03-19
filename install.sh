#!/bin/bash

SCRIPT_NAME="cesar"
INSTALL_DIR="/usr/local/bin"
SHARE_DIR="/usr/local/share/$SCRIPT_NAME"
SCRIPT_FILE="App/cesar.sh"
PYTHON_FILE="Encryption/cesar.py"

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root: sudo ./install.sh" >&2
    exit 1
fi

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo "Python3 is required but not installed. Please install it first." >&2
    exit 1
fi

# Create the shared directory
mkdir -p "$SHARE_DIR"

# Move scripts to the appropriate locations
cp "$SCRIPT_FILE" "$INSTALL_DIR/$SCRIPT_NAME"
cp "$PYTHON_FILE" "$SHARE_DIR/"

# Make the script executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Update cesar.sh to point to the new Python script location
sed -i "s|SCRIPT_DIR=.*|SCRIPT_DIR=\"$SHARE_DIR\"|" "$INSTALL_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME installed successfully!"
echo "You can now use it by running: $SCRIPT_NAME"

