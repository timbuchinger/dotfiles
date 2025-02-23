# Windows Terminal Configuration

This directory contains configuration for Microsoft's Windows Terminal that sets WSL as the default terminal profile.

## Installation

1. Open Windows Terminal
2. Press `Ctrl+,` to open settings
3. Click "Open JSON file" in the bottom left corner
4. Copy the contents of `settings.json` and paste it into your settings file
5. Save the file

## Features

- Sets WSL as the default profile for new tabs
- Uses "One Half Dark" color scheme
- Configures CaskaydiaCove Nerd Font (12pt)
- Enables transparency with acrylic effect (95% opacity)
- Includes PowerShell and Command Prompt as additional profiles

## Requirements

- Windows Terminal (install from Microsoft Store or GitHub)
- WSL2 installed and configured
- CaskaydiaCove Nerd Font (optional, replace with your preferred font in settings)

## Note

The WSL GUID used (`2c4de342-38b7-51cf-b940-2309a097f518`) is the default GUID for the WSL profile. This should work automatically with any WSL distribution installed on your system.
