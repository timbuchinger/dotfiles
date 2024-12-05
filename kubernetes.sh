#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
brew install siderolabs/tap/talosctl
brew install kubecolor
brew install kubectx
brew install helm
brew install derailed/k9s/k9s


