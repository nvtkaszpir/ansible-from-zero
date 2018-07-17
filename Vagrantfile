# -*- mode: ruby -*-
# vi: set ft=ruby :

V_CPU = 1 # in cores
V_MEM = 512 # in megabytes per core
V_MEM_TOTAL = V_MEM * V_CPU
SYNC_TYPE = "rsync" # how to sync files in vagrant, for lxc rsync is suggested


VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  # providers
  config.vm.provider "virtualbox" do |v|
    v.cpus = V_CPU
    v.memory = V_MEM_TOTAL
  end

  config.vm.provider :libvirt do |libvirt, override|
    # this is vagrant, vm is disposable, so set up supper agressive disk access
    libvirt.cpu_mode = 'host-passthrough'
    libvirt.cpus = V_CPU
    libvirt.memory = V_MEM_TOTAL
    libvirt.random_hostname = true
    libvirt.video_type = 'vmvga'
    libvirt.video_vram = '16384'
    libvirt.volume_cache = 'unsafe'

  end

  # virtual machines
  config.ssh.insert_key = false

  # control node
  config.vm.define "ubuntu-1" do |s|
    s.vm.box = "generic/ubuntu1604"
    s.vm.network "private_network", ip: "192.168.50.10"
    s.vm.provision "shell", path: "provisioning/shell/ansible-ubuntu.sh"

  end

  config.vm.define "centos-1" do |s|
    s.vm.box = "centos/7"
    s.vm.network "private_network", ip: "192.168.50.21"
  end
  config.vm.define "debian-1" do |s|
    s.vm.box = "generic/debian9"
    s.vm.network "private_network", ip: "192.168.50.31"
  end
  config.vm.define "ubuntu-11" do |s|
    s.vm.box = "generic/ubuntu1604"
    s.vm.network "private_network", ip: "192.168.50.11"
  end

  config.vm.provision "shell", path: "provisioning/shell/common.sh"

end
