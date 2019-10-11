#!/usr/bin/env bash

curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh -o install_nvm.sh
bash install_nvm.sh

source $HOME/.nvm/nvm.sh
nvm install v10.16.0
