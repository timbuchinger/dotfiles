#!/bin/bash
set -e  # Exit on error

# Check if brew is available
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed"
    exit 1
fi

echo "Adding Hashicorp tap..."
brew tap hashicorp/tap || {
    echo "Error: Failed to add Hashicorp tap"
    exit 1
}

echo "Installing HCP CLI..."
brew install hashicorp/tap/hcp || {
    echo "Error: Failed to install HCP CLI"
    exit 1
}

echo "HCP CLI installation complete!"
