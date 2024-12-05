#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
brew install siderolabs/tap/talosctl
brew install kubecolor
brew install kubectx
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
