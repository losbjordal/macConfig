# /bin/sh

## install brew
# installation of brew requires more steps
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## test if brew is installed

if [ -x "$(command -v brew)" ]; then
    echo "brew found"

    brew install kubectl
    brew install openshift-cli
    brew install sops
    brew install age
    brew install flux
    brew install go
    brew install vault
    brew install argocd
    brew install helm
    brew install ripgrep
    brew install yq jq
    brew install --cask alt-tab
    brew install --cask rectangle
    brew install --cask powershell
    brew install azure-cli
    #brew install --cask zenmap # install via gui

    # https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
    # https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git
    brew install gpg2 gnupg pinentry-mac
    brew tap microsoft/git
    brew install --cask git-credential-manager-core

else
    echo "brew not found"
fi
