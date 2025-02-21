#!/bin/bash
set -e  # Exit on error

echo "Checking .bashrc configuration..."

# Function to safely append line if it doesn't exist
append_if_not_exists() {
    local line="$1"
    if ! grep -Fxq "$line" ~/.bashrc; then
        echo "$line" >> ~/.bashrc
        echo "Added: $line"
    fi
}

# Check and add Kubernetes aliases and configurations
append_if_not_exists 'alias k="kubecolor"'
append_if_not_exists 'export KUBE_EDITOR="code -w"'
append_if_not_exists 'source <(kubectl completion bash)'
append_if_not_exists 'complete -o default -F __start_kubectl k'
append_if_not_exists 'export TALOS_EDITOR="code -w"'

echo "Configuration update complete!"
