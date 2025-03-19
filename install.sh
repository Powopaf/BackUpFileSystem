#!/bin/bash

SCRIPT_NAME="cesar"
INSTALL_DIR="/usr/local/bin"
SHARE_DIR="/usr/local/share/$SCRIPT_NAME"
SCRIPT_FILE="App/cesar.sh"
PYTHON_FILE="Encryption/cesar.py"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root: sudo ./install.sh" >&2
    exit 1
fi

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo "Python3 is required but not installed. Please install it first." >&2
    exit 1
fi

# Create directory for Python script
mkdir -p "$SHARE_DIR"

# Copy Python script
cp "$PYTHON_FILE" "$SHARE_DIR/cesar.py"

# Copy main shell script
cp "$SCRIPT_FILE" "$INSTALL_DIR/$SCRIPT_NAME"

# Make the script executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Update cesar.sh to use the correct path to cesar.py
sed -i "s|PYTHON_SCRIPT=.*|PYTHON_SCRIPT=\"$SHARE_DIR/cesar.py\"|" "$INSTALL_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME installed successfully!"
echo "You can now use it by running: $SCRIPT_NAME <file> <key>"

