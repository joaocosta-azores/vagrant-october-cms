# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.8.6"

VAGRANT_API_VERSION = "2"
GUEST_HOSTNAME = "PROJECT.dev"
GUEST_NETWORK_IP = "192.168.59.76"
GUEST_MEMORY_LIMIT = "1024"
GUEST_CPU_LIMIT = "1"
GUEST_DIRECTORY = "/var/www/PROJECT"

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

    config.vm.synced_folder "./", GUEST_DIRECTORY, :owner => 'www-data', :group => 'www-data'

    config.vm.provision "shell", path: "install/lamp-install.sh"

end

