# Kubernetes
alias k="kubecolor"
export KUBE_EDITOR="nano"
source <(kubectl completion bash)
complete -o default -F __start_kubectl k
