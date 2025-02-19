#!/bin/bash


brew install kubectl --classic
brew install siderolabs/tap/talosctl
brew install kubecolor
brew install kubectx
brew install helm
brew install derailed/k9s/k9s

brew tap robscott/tap
brew install robscott/tap/kube-capacity

source ~/.bashrc

kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null

source ~/.bashrc

