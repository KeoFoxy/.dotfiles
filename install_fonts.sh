#!/bin/bash

FONT_DIR="./Fonts"

install_fonts_mac() {
    echo "Installing macOS fonts..."
    DEST_DIR="$HOME/Library/Fonts"
    find "$FONT_DIR" -type f -name "*.otf" -exec cp -v {} "$DEST_DIR" \;
    echo "All fonts has been installed"
}

install_fonts_linux() {
    echo "Installing Linux fonts..."
    DEST_DIR="$HOME/.local/share/fonts"
    mkdir -p "$DEST_DIR"
    find "$FONT_DIR" -type f -name "*.otf" -exec cp -v {} "$DEST_DIR" \;
    fc-cache -fv
    echo "All fonts has been installed"
}

# NOT WORKING
install_fonts_windows() {
    echo "Installing Windows fonts via PowerShell..."
    
    if ! command -v powershell.exe &>/dev/null; then
        echo "Error: powershell.exe not found in PATH. Execute script in WSL/MSYS or add PowerShell to PATH." >&2
        exit 1
    fi
    
    WIN_FONT_DIR=$(wslpath -w "$FONT_DIR")
    
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \
    "Copy-Item -Path '${WIN_FONT_DIR}\\*.otf' -Destination 'C:\\Windows\\Fonts' -Force -Recurse"
    echo "All fonts have been installed to C:\\Windows\\Fonts"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    install_fonts_mac
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    install_fonts_linux
    elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]]; then
    install_fonts_windows
else
    echo "Unknown OS: $OSTYPE"
    exit 1
fi
