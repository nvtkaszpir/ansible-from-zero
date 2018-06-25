# Ansible form zero

Repo to help people get to know Ansible from complete zero.

# Known limitations

- tested under Ubuntu 16.04 with libvirt, should work with virtualbox.

# Requirements
- vagrant https://www.vagrantup.com/downloads.html
- apt packages on control machine:
```bash
sudo apt-get update
sudo apt-get install -y python-pip python-virtualenv python-dev

```

# Before doing any command:
Execute below on control-machine

```bash
virtualenv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt
```

# Vagrant

## Run vagrant from scratch
```bash
vagrant destroy -f
vagrant up
```

## Vagrant debug
```bash
vagrant provision --provision-with=ansible
ansible -m setup -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
```


# Interesting commands

## what parameters were changed in ansible run
ansible-config -c ansible.cfg dump

## show inventory hosts
ansible-inventory -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory  --list

## get vars about hosts from inventory
ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m setup all

## use generated inventory by vagrant directly
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory provisioning/ansible/play_12.yml

## Notice missing/existing binaries per host
ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m shell -a "which ntpd" all
ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m shell -a "which crhonyc" all

## will error on Debian
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory provisioning/ansible/play_13.yml


# TODO talks
- ugly files
- templates
- handlers
- conditinals based on registered vars,
- facts


- raw and python
- ssh keys add, remove
- editor + yamllint/ansible-lint
- yaml formatting - folding, quotes and newlines
- old and new format and the future
- splitting roles
- defaults vs fail fast
- the hell of adding/removing resources
- strategy linear vs free


- scalability - reverse provisioning
