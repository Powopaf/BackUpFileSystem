#!/bin/bash

INSTALL_DIR="/usr/local/bin/cesar"
SHARE_DIR="/usr/local/share/cesar"

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root: sudo ./uninstall.sh" >&2
    exit 1
fi

rm -f "$INSTALL_DIR"
rm -rf "$SHARE_DIR"

echo "Cesar command uninstalled successfully."
