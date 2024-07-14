#!/bin/bash

if ! command -v npm &> /dev/null; then
  echo "Error!: Npm is not installed. Run install brew packages and try again."
  exit 1
fi

echo "Installing global npm packages..."
npm install -g eslint eslint_d typescript
echo "All global packages has been installed." 
