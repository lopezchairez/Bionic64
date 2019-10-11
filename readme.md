# Bionic64
Virtual Machine created to run apps built in PHP 5.6.

## Prerequisites
Install [Git](https://git-scm.com/downloads)  
Install [Vagrant](https://www.vagrantup.com/downloads.html)  
Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)  
Install [MySQL Workbench](https://dev.mysql.com/downloads/workbench)  

## Windows
You may need to enable hardware virtualization (VT-x). It can usually be enabled via your BIOS. If you are using [Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) on a UEFI system you may additionally need to disable Hyper-V in order to access VT-x.

## Features
- Ubuntu Bionic 18.04.2 LTS
- Apache 2.4.39
- PHP 5.6.40
- MySQL 5.6.44
- python 2.7.15
- python 3.5.7
- python 3.6.7
- python 3.7.3
- pip 19.1.1
- nvm 0.34.0
- node v10.16.0
- npm 6.9.0
- Zend Framework 1.11.1

## Installation

Install the vagrant disk-size plugin
```bash
vagrant plugin install vagrant-disksize
```

Clone the VM repository
```bash
git clone git@github.com:lopezchairez/bionic64.git ~/Bionic64
```

Boot the VM
```bash
cd ~/Bionic64 && vagrant up
```

Load the Apache default page in the [browser](http://192.168.30.10)

## Vagrant commands

The following table contains the basic vagrant commands.

Command | Description
--- | ---
```vagrant status``` | Check if the VM is running
```vagrant up``` | Boot the VM
```vagrant ssh``` | Log into the VM
```vagrant reload``` | Reload the VM
```vagrant halt``` | VM Shutdown
```vagrant destroy``` | Destroy the VM

## MySQL Workbench Connection Settings

Connection Method: Standard TCP/IP over SSH

```
SSH Hostname: 192.168.30.10  
SSH Username: vagrant  
SSH Key File: ~/Bionic64/.vagrant/machines/default/virtualbox/private_key  
```

```
MySQL Host: 127.0.0.1  
MySQL Port: 3306  
MySQL User: root  
MySQL Pass: root  
```

## Zend Framework
The installed version is 1.11.1.

To create a zend app run the following command:
```bash
zf create project myApp
```

To list all the commands just hit ```zf```

You can reference the [manual](https://framework.zend.com/manual/1.11/en/reference.html) in the Zend Framework website.
