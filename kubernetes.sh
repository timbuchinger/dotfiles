#!/bin/bash
set -e  # Exit on error

# Check if brew is available
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed"
    exit 1
fi

# Install kubectl
echo "Installing kubectl..."
brew install kubectl || {
    echo "Error: Failed to install kubectl"
    exit 1
}

# Install talosctl
echo "Installing talosctl..."
brew install siderolabs/tap/talosctl || {
    echo "Error: Failed to install talosctl"
    exit 1
}

# Install kubecolor
echo "Installing kubecolor..."
brew install kubecolor || {
    echo "Error: Failed to install kubecolor"
    exit 1
}

# Install kubectx
echo "Installing kubectx..."
brew install kubectx || {
    echo "Error: Failed to install kubectx"
    exit 1
}

# Install helm
echo "Installing helm..."
brew install helm || {
    echo "Error: Failed to install helm"
    exit 1
}

# Install k9s
echo "Installing k9s..."
brew install derailed/k9s/k9s || {
    echo "Error: Failed to install k9s"
    exit 1
}

# Add robscott tap and install kube-capacity
echo "Adding robscott tap..."
brew tap robscott/tap || {
    echo "Error: Failed to add robscott tap"
    exit 1
}

echo "Installing kube-capacity..."
brew install robscott/tap/kube-capacity || {
    echo "Error: Failed to install kube-capacity"
    exit 1
}

# Configure kubectl completion
echo "Setting up kubectl completion..."
if ! kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null; then
    echo "Error: Failed to set up kubectl completion"
    exit 1
fi

source ~/.bashrc

echo "Kubernetes tools installation complete!"
