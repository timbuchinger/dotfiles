#!/bin/bash
set -e  # Exit on error

# Check if apt is available
if ! command -v apt-get &> /dev/null; then
    echo "Error: apt-get is not installed. This script requires Debian/Ubuntu."
    exit 1
fi

# Update package database
echo "Updating package database..."
sudo apt-get update

# Check for git
if ! command -v git &> /dev/null; then
    echo "Installing git..."
    sudo apt-get install -y git || {
        echo "Error: Failed to install git"
        exit 1
    }
fi

# Install build tools
echo "Installing build dependencies..."
sudo apt-get install -y build-essential || {
    echo "Error: Failed to install build dependencies"
    exit 1
}

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null || {
    echo "Error: Failed to install Homebrew"
    exit 1
}

current_user=$(whoami)

if ! grep -Fxq 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' /home/$current_user/.bashrc; then
  echo >> /home/$current_user/.bashrc
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$current_user/.bashrc
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.bashrc

echo "Installing GCC through Homebrew..."
brew install gcc || {
    echo "Error: Failed to install GCC through Homebrew"
    exit 1
}

echo "Homebrew installation and setup complete!"
