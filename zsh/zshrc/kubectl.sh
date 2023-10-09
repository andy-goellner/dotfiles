alias k="kubectl"
alias ke="kubectl exec -it"

find-pod() {
  k get pods | grep -m1 -o "\S*-$1-\S*"
}

console() {
  ke $(find-pod 'console') -- bash
}
