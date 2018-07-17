#!/bin/bash
#
export LANG=en_US.UTF-8

# install ansible under Ubuntu
sudo apt-get install -y \
	git \
	mc \
	nano \
	python \
	python-dev \
	python-pip \
	python-simplejson \
	python-virtualenv \
	vim

if [ ! -d /home/vagrant/ansible-from-zero ]; then
	git clone https://github.com/nvtkaszpir/ansible-from-zero.git
else
	cd /home/vagrant/ansible-from-zero
	git fetch --all
	git reset --hard
	git pull
fi

cd /home/vagrant/ansible-from-zero
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
