#!/bin/zsh
# Usage:
#   tuse staging-us billing
#   tuse staging-us billing exec "a reason to exec"

# roles are exec=for normal, edit=for changing replicas, etc.

#-e exit on error, -u fail on unset, -x echo, -o pipefail - fail if any pipes have errors

declare -A kubeEnvironments=(
  [staging]=staging-us
  [sandbox]=sandbox-use1-eks1
  [prod]=prod
  [prod-eu]=prod-eu
  [prod-us]=prod-us-eks
)

declare -A roleEnvironments=(
  [staging]=staging_us
  [sandbox]=sandbox_us
  [prod]=production
  [prod-eu]=production_eu
  [prod-us]=production_us
)

declare -A namespaces=(
  [billing]=562-billing
  [pricing]=337-pricing
  [bookkeep]=473-bookkeep
  [checkr]=273-checkr
  [kafka]=401-kafka-consumer-monitoring
)

function tuse {
  tsh kube login ${kubeEnvironments[$1]}
  kubectl config set-context --current --namespace=${namespaces[$2]}
  tsh request new --roles="${namespaces[$2]}-exec-${roleEnvironments[$1]}" --reason="troubleshooting"
  tsh kube login ${kubeEnvironments[$1]}
}

function tedit {
  tsh kube login ${kubeEnvironments[$1]}
  kubectl config set-context --current --namespace=${namespaces[$2]}
  tsh request new --roles="${namespaces[$2]}-edit-${roleEnvironments[$1]}" --reason="scaling pods"
  tsh kube login ${kubeEnvironments[$1]}
}

# tsh kube login "$1"
# tsh request new --roles="${namespaces[$2]}-$role-${environments[$1]}" --reason="$reason"
# kubectl config set-context --current --namespace=${namespaces[$2]}
