# oc/OpenShift
cat >>~/.zshrc<<EOF
if [ $commands[oc] ]; then
  source <(oc completion zsh)
  compdef _oc oc
fi
EOF


kubectl completion zsh > $ZSH_CACHE_DIR/completions/_kubectl
# helm autocompletion
#if [ $commands[helm] ]; then source <(helm completion zsh); compdef _helm helm; fi
# oc autocompleteion
#if [ $commands[oc] ]; then source <(oc completion zsh); compdef _oc oc; fi
# flux completion
#if [ $commands[flux] ]; then source <(flux completion zsh); compdef _flux flux; fi
#if [ $commands[argocd] ]; then source <(argocd completion zsh); compdef _argocd argocd; fi
#if [ $commands[velero] ]; then source <(velero completion zsh); compdef _velero velero; fi

helm completion zsh > $ZSH_CACHE_DIR/completions/_helm
oc completion zsh > $ZSH_CACHE_DIR/completions/_oc
flux completion zsh > $ZSH_CACHE_DIR/completions/_flux
argocd completion zsh > $ZSH_CACHE_DIR/completions/_argocd
velero completion zsh > $ZSH_CACHE_DIR/completions/_velero
flux completion zsh > $ZSH_CACHE_DIR/completions/_flux
