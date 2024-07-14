#!/bin/bash

chmod +x ./install_fonts.sh
chmod +x ./install_brew_packages.sh
chmod +x ./install_npm_packages.sh

if [[ "$1" == "-all" ]]; then
  echo "Installing all scripts..."
  ./install_fonts.sh
  ./install_brew_packages.sh
  ./install_npm_packages.sh
else
  echo "All scripts are now executable. Use -all arg to install all scripts."
fi
