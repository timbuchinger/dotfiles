#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null

current_user=$(whoami)

if ! grep -Fxq 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' /home/$current_user/.bashrc; then
  echo >> /home/$current_user/.bashrc
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$current_user/.bashrc
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.bashrc

brew install gcc
