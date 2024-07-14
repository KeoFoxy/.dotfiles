#!/bin/bash

packages=(
    "git"
    "zsh"
    "neovim"
    "swiftformat"
    "eza"
    "neofetch"
    "node"
)

install_package() {
    if brew list "$1" &>/dev/null; then
        echo "$1 already installed"
    else
        echo "Installing $1..."
        brew install "$1"
    fi
}

for package in "${packages[@]}"; do
    install_package "$package"
done

echo "All packages installed"
