# Kubernetes
alias k="kubecolor"
export KUBE_EDITOR="code -w"
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

export TALOS_EDITOR="code -w"
