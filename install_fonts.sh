#!/bin/bash

FONT_DIR="./Fonts"

install_fonts_mac() {
    echo "Установка шрифтов на macOS..."
    DEST_DIR="$HOME/Library/Fonts"
    find "$FONT_DIR" -type f -name "*.otf" -exec cp -v {} "$DEST_DIR" \;
    echo "Все шрифты установлены на macOS."
}

# Функция для установки шрифтов на Linux
install_fonts_linux() {
    echo "Установка шрифтов на Linux..."
    DEST_DIR="$HOME/.local/share/fonts"
    mkdir -p "$DEST_DIR"
    find "$FONT_DIR" -type f -name "*.otf" -exec cp -v {} "$DEST_DIR" \;
    fc-cache -fv
    echo "Все шрифты установлены на Linux."
}

# Функция для установки шрифтов на Windows
install_fonts_windows() {
    echo "Установка шрифтов на Windows..."
    DEST_DIR="/mnt/c/Windows/Fonts"
    find "$FONT_DIR" -type f -name "*.otf" -exec cp -v {} "$DEST_DIR" \;
    echo "Все шрифты установлены на Windows."
}

# Определение операционной системы и установка шрифтов
if [[ "$OSTYPE" == "darwin"* ]]; then
    install_fonts_mac
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    install_fonts_linux
    elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]]; then
    install_fonts_windows
else
    echo "Неизвестная операционная система: $OSTYPE"
    exit 1
fi
