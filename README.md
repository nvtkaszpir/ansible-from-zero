# Ansible from zero

Repo to help people get to know Ansible from complete zero.

# Known limitations

- tested under Ubuntu 16.04 with libvirt, should work with virtualbox.

# Requirements

- vagrant https://www.vagrantup.com/downloads.html
- virtual machine provider - choose one of (if unsure, choose virtualbox):
  - virtualbox https://www.virtualbox.org/wiki/Downloads
  - libvirt https://github.com/vagrant-libvirt/vagrant-libvirt

# Starting the setup

Ensure to install vagrant and desired virtual machine provider.
Clone this repo and then just run:

```bash
vagrant up
```

... and wait till it downloads system images and runs provision
Should take about 10 minutes in total - about 3 min to download images and 3 minutes to provision guests in sequence.

# Logging in to control-machine

After vagrant up you can SSH to the control-machine:

```bash
vagrant ssh ubuntu-1
```

After log in you should see `ansible-from-zero` directory.

# Before doing any command on control node:

Execute below on control-machine, to be sure there is properly activated virtualenv
environment and there are installed specific versions of the required packages.

```bash
cd /home/vagrant/ansible-from-zero
virtualenv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt
```

Now you should be able to run commands from the within directory 
`/home/vagrant/ansible-from-zero`


# Interesting commands

## what parameters were changed in ansible run

```bash
ansible-config -c ansible.cfg dump
```

## show inventory hosts

```bash
ansible-inventory -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory  --list
```

## get vars about hosts from inventory

```bash
ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m setup all
```

## use generated inventory by vagrant directly

```bash
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory provisioning/ansible/play_12.yml
```

## Notice missing/existing binaries per host

```bash
ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m shell -a "which ntpd" all
ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m shell -a "which chronyc" all
```

## will error on Debian

```bash
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory provisioning/ansible/play_13.yml
```

# Vagrant specific

## Run vagrant from scratch

```bash
vagrant destroy -f
vagrant up
```


# TODO talks

- ugly files
- templates
- handlers
- conditionals based on registered vars,
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

