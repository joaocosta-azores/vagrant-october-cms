
## What is this?

A couple of vagrant provision scripts optimized for Ubuntu 16.04 and Laravel 5.4

Provision scripts include:
- LAMP with PHP 7, Laravel, MariaDB, Apache
- Utils: multitail, xdebug, tmux
- nvm, npm, nodejs

Custom configuration:
- vhost for the project
- dotfiles (.vimrc, .bash_aliases, .profile)
- mariadb:
    - create db
    - run initial laravel migrations
    - root user with no password
    - configured to allow external incoming connections (i.e Sequel Pro)

## Purpose?

Easily launch a new VM with Ubuntu and a skeleton Laravel project. Add a hosts line pointing to project/ip and we're ready to code locally.

## How does it work?

1. Copy this repo over to your new project directory

    ``` cp -r vagrant-laravel-starter NEW-PROJECT ```

2. Edit the Vagrantfile according to your needs

3. Run vagrant up (this might take a while...)

4. Configure your hosts file to point to the IP set in the Vagrant file

5. Point your browser to your guest hostname. You should see the new Laravel app up and running

## Requirements

- Vagrant 1.8.6+
- VirtualBox 5.1.12+
- OS X El Capitan (hasn't been tested elsewhere)

