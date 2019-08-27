# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10", guest: 3000, host: 3000

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./data", "/home/vagrant/data", create: true, type: "virtualbox"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  # privileged: falseでroot以外の（何かはしらんけど多分vagrant）ユーザーでsudoで実行

  # [アプデとyum install諸々]
  config.vm.provision "shell", path: "provision/scripts/install_utils.sh", privileged: false
  # [kill firewalld]
  config.vm.provision "shell", path: "provision/scripts/kill_firewall.sh", privileged: false
  # [node]
  # なんかしらんけど最後に書いたらなんか入らなかったのでこっちにもってきた
  config.vm.provision "shell", path: "provision/scripts/install_node.sh", privileged: false
  # [disable selinux]
  config.vm.provision "file", source: "provision/files/selinux_config", destination: "~/config"
  config.vm.provision "shell", path: "provision/scripts/send_selinux_config.sh", privileged: false
  # [php install]
  config.vm.provision "shell", path: "provision/scripts/install_php.sh", privileged: false
  # [phpmyadmin]
  config.vm.provision "file", source: "provision/files/remi.repo", destination: "~/remi.repo"
  config.vm.provision "shell", path: "provision/scripts/install_phpmyadmin.sh", privileged: false
  # [httpd.conf overload(for phpmyadmin)]
  config.vm.provision "file", source: "provision/files/phpMyAdmin.conf", destination: "~/phpMyAdmin.conf"
  # idk why occur the problem what i can't boot mysqld
  # with `mv phpMyAdmin.conf`, but can `cp` then `rm -rf` flow.
  # completely unclear... does anyone know the cause?
  config.vm.provision "shell", path: "provision/scripts/update_phpmyadmin.conf.sh", privileged: false
  # [mariadb]
  config.vm.provision "shell", path: "provision/scripts/install_mariadb1.sh", privileged: false
  config.vm.provision "file", source: "provision/files/mariadb.repo", destination: "~/mariadb.repo"
  config.vm.provision "shell", path: "provision/scripts/install_mariadb2.sh", privileged: false
end
