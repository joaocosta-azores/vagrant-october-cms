#!/bin/bash

# Install Node.js and npm
echo ===============================================================
echo ============== NODE.JS AND NPM INSTALL ========================
echo ===============================================================
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
bash install_nvm.sh
echo "source $VAGRANT_HOME/.nvm/nvm.sh" >> $VAGRANT_HOME/.profile
source $VAGRANT_HOME/.profile
nvm install 6.0.0
