#!/bin/bash
set -e  # Exit on error

# Check if zypper is available
if ! command -v zypper &> /dev/null; then
    echo "Error: zypper is not installed. This script requires OpenSUSE."
    exit 1
fi

# Update package database
echo "Updating package database..."
sudo zypper refresh

# Check for git
if ! command -v git &> /dev/null; then
    echo "Installing git..."
    sudo zypper install -y git-core || {
        echo "Error: Failed to install git"
        exit 1
    }
fi

# Install required build tools
echo "Installing build dependencies..."
sudo zypper install -y gcc gcc-c++ make || {
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

# Configure shell environment
if ! grep -Fxq 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' /home/$current_user/.bashrc; then
    echo "Configuring shell environment..."
    echo >> /home/$current_user/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$current_user/.bashrc
fi

# Apply shell environment changes
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.bashrc

# Install gcc through Homebrew
echo "Installing GCC through Homebrew..."
brew install gcc || {
    echo "Error: Failed to install GCC through Homebrew"
    exit 1
}

echo "Homebrew installation and setup complete!"
