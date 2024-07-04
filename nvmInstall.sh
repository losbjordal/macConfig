brew install nvm
mkdir -p ~/<home-dir>/.nvm

nvm ls-remote # se alle lts versjoner remotely
#nvm install --lts=hydrogen # node18
nvm install --lts=iron # node20
nvm list # list lokale (installerte) node versjoner
nvm use lts/iron # for node20
#nvm use lts/hydrogen # node18
