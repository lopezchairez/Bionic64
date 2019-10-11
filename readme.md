# Bionic64
Virtual Machine created to run apps built in PHP 5.6.

## Prerequisites
Install [Git](https://git-scm.com/downloads)  
Install [Vagrant](https://www.vagrantup.com/downloads.html)  
Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 

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

## Setup

Install the VM
```bash
git clone git@github.com:lopezchairez/bionic64.git ~/Bionic64
```

Boot the VM
```bash
cd ~/Bionic64 && vagrant up
```

## Sources
[Get Off MAMP](https://laracasts.com/lessons/get-off-mamp-now)  
