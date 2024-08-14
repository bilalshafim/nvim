#!/bin/bash

# Check if Go is installed
if ! command -v go &> /dev/null
then
    echo "Go is not installed. Please install Go before running this script."
    exit 1
fi

# Install Go tools
echo "Installing Go tools..."

go install github.com/incu6us/goimports-reviser/v3@latest
go install mvdan.cc/gofumpt@latest
go install github.com/segmentio/golines@latest
go install github.com/go-delve/delve/cmd/dlv@latest

echo "Go tools have been installed successfully."

# Open nvim again to ensure nvim-treesitter for Go is installed
echo "Opening nvim to ensure nvim-treesitter for Go is installed..."
nvim -c ':TSInstall go' -c ':q'

# Run nvim for user to start working
echo "Starting nvim..."
nvim

