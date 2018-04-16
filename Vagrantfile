# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.8.6"

VAGRANT_API_VERSION = "2"

PROJECT = 'PROJECT_NAME'
MYSQL_DB_NAME='DB_NAME'
MYSQL_USER='root'
MYSQL_PASSWORD='PASSWORD'
EMAIL='joaocosta.azores@gmail.com'
VAGRANT_HOME='/home/vagrant'

GUEST_HOSTNAME = PROJECT + ".dev"
GUEST_NETWORK_IP = "192.168.59.80"
GUEST_MEMORY_LIMIT = "1024"
GUEST_CPU_LIMIT = "1"
GUEST_DIRECTORY = "/var/www/" + PROJECT

ARGS = {
        "PROJECT" => PROJECT,
        "MYSQL_PASSWORD" => MYSQL_PASSWORD,
        "MYSQL_DB_NAME" => MYSQL_DB_NAME,
        "MYSQL_USER" => MYSQL_USER,
        "EMAIL" => EMAIL,
        "GUEST_HOSTNAME" => GUEST_HOSTNAME,
        "GUEST_NETWORK_IP" => GUEST_NETWORK_IP,
        "GUEST_DIRECTORY" => GUEST_DIRECTORY,
        "VAGRANT_HOME" => VAGRANT_HOME
        }

#########################################################
# You shouldn't have to modify anything below this line #
#########################################################

Vagrant.configure(VAGRANT_API_VERSION) do |config|

    config.vm.box = "bento/ubuntu-16.04"
    config.vm.hostname = GUEST_HOSTNAME
    config.vm.network "private_network", ip: GUEST_NETWORK_IP

    # Allow more memory usage for the VM
    config.vm.provider :virtualbox do |v|
        v.memory = GUEST_MEMORY_LIMIT
        v.cpus = GUEST_CPU_LIMIT
        v.name = GUEST_HOSTNAME
    end

    # forward agent for ansible access
    config.ssh.forward_agent = true

    config.vm.synced_folder "./", GUEST_DIRECTORY, :owner => 'vagrant', :group => 'www-data', :mount_options => ["dmode=777,fmode=777"]

    config.vm.provision "shell", path: "install/start-install.sh", env: ARGS
    config.vm.provision "shell", path: "install/apache-install.sh", env: ARGS
    config.vm.provision "shell", path: "install/maria-db-install.sh", env: ARGS
    config.vm.provision "shell", path: "install/php-install.sh", env: ARGS
    config.vm.provision "shell", path: "install/utils-install.sh", env: ARGS
    config.vm.provision "shell", path: "install/dotfiles-install.sh", env: ARGS
    config.vm.provision "shell", path: "install/node-install.sh", privileged:false, env: ARGS
    config.vm.provision "shell", path: "install/laravel-install.sh", privileged: false, env: ARGS
    config.vm.provision "shell", path: "install/end-install.sh", privileged: false, env: ARGS

end

