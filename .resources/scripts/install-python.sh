#!/usr/bin/env bash

add-apt-repository ppa:deadsnakes/ppa
apt-get update

apt-get install -y python3.6
apt-get install -y python3-distutils

curl https://bootstrap.pypa.io/get-pip.py | sudo python3
pip install virtualenv
