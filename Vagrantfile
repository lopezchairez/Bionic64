# -*- mode: ruby -*-
# vi: set ft=ruby :

ubuntu_log_file = File.join(Dir.pwd, ".resources/tmp/ubuntu-bionic-18.04-cloudimg-console.log")
scripts_path = File.join(Dir.pwd, ".resources/scripts")

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "bionic64"
  config.vm.network "private_network", ip: "192.168.30.10"
  config.disksize.size = "40GB"

  config.vm.synced_folder "./code", "/var/www",
    id: "idx1",
    mount_options: ["dmode=777", "fmode=777"],
    owner: 'vagrant', 
    group: 'www-data'

  config.vm.synced_folder "./encrypted", "/encrypted",
    id: "idx2",
    mount_options: ["dmode=777", "fmode=777"],
    owner: 'vagrant', 
    group: 'www-data'

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--uartmode1", "file", ubuntu_log_file]
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "bootstrap", type: "shell" do |s|
    s.path = scripts_path + '/bootstrap.sh'
  end

  config.vm.provision "install-apache", type: "shell" do |s|
    s.path = scripts_path + '/install-apache.sh'
  end

  config.vm.provision "install-vhost", type: "shell" do |s|
    s.path = scripts_path + '/install-vhost.sh'
  end

  config.vm.provision "install-mysql", type: "shell" do |s|
    s.path = scripts_path + '/install-mysql5.sh'
  end

  config.vm.provision "install-php7", type: "shell" do |s|
    s.path = scripts_path + '/install-php7.sh'
  end

  # config.vm.provision "install-zend5", type: "shell" do |s|
  #   s.path = scripts_path + '/install-zend5.sh'
  # end

  config.vm.provision "install-python", type: "shell" do |s|
    s.path = scripts_path + '/install-python.sh'
  end

  config.vm.provision "install-node", type: "shell", privileged: false do |s|
    s.path = scripts_path + '/install-node.sh'
  end

  config.vm.provision "install-aliases", type: "shell", privileged: false do |s|
    s.path = scripts_path + '/install-aliases.sh'
  end

end
