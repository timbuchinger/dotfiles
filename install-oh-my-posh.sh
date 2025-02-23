#!/bin/bash

# Exit on error
set -e

echo "Installing oh-my-posh..."
brew install jandedobbeleer/oh-my-posh/oh-my-posh

echo "Installing JetBrainsMono Nerd Font..."
# Create fonts directory if it doesn't exist
mkdir -p ~/Library/Fonts
# Download and install font
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -o ~/Downloads/JetBrainsMono.zip
unzip -o ~/Downloads/JetBrainsMono.zip -d ~/Library/Fonts
rm ~/Downloads/JetBrainsMono.zip

echo "Installing Meslo font..."
oh-my-posh font install meslo

echo "Configuring oh-my-posh..."
# Create config directory
mkdir -p ~/.config/oh-my-posh

# Download and set up atomic theme
curl -L https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/M365Princess.omp.json -o ~/.config/oh-my-posh/M365Princess.omp.json

# Add oh-my-posh initialization to shell config
echo 'eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/M365Princess.omp.json)"' >> ~/.bashrc

echo "Installation complete! Please restart your terminal or run 'source ~/.bashrc'"
