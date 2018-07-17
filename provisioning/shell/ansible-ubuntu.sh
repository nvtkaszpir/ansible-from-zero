#!/bin/bash
#
export LANG=en_US.UTF-8

# install ansible under ubuntu
sudo apt-get install -y python python-simplejson python-virtualenv python-pip git python-dev mc vim nano

git clone https://github.com/nvtkaszpir/ansible-from-zero.git || true
cd ansible-from-zero
virtualenv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
ansible --version

mkdir -p /home/vagrant/.ssh
cp -f /home/vagrant/ansible-from-zero/insecure_private_key /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

# add ssk to known hosts
ssh-keyscan -H 192.168.50.11 192.168.50.21 192.168.50.31 >> /home/vagrant/.ssh/known_hosts


chown -R vagrant:vagrant /home/vagrant

