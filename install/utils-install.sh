#!/bin/bash

# Install composer
echo ===============================================================
echo ============== COMPOSER INSTALL ===============================
echo ===============================================================
apt-get -y install composer

# Installing utils
echo ===============================================================
echo ============== Utils: multitail, tmux
echo ===============================================================
apt -y install multitail tmux