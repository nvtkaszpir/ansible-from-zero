# -*- mode: ruby -*-
# vi: set ft=ruby :

V_CPU = 1 # in cores
V_MEM = 512 # in megabytes per core
V_MEM_TOTAL = V_MEM * V_CPU
SYNC_TYPE = "rsync" # how to sync files in vagrant, for lxc rsync is suggested


VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  # providers

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

  config.vm.define "centos-1" do |s|
    s.vm.box = "centos/7"
  end
  config.vm.define "debian-1" do |s|
    s.vm.box = "generic/debian9"
  end
  config.vm.define "ubuntu-1" do |s|
    s.vm.box = "generic/ubuntu1604"
  end


  config.vm.provision "ansible" do |ansible|
    # # notice, galaxy ins executed per each node.
    # ansible.galaxy_role_file = 'provisioning/ansible/requirements.yml'
    # ansible.galaxy_roles_path = 'provisioning/ansible/.galaxy'

    ansible.compatibility_mode = "2.0"
    ansible.playbook = "provisioning/ansible/play_00.yml"
    ansible.groups = {
      "group_alpha" => [ "ubuntu-1" ],
      "group_bravo" => [ "centos-1" ],
      "group_charlie" => [ "debian-1", "ubuntu-1" ],
    }
    ansible.verbose = 'v'
  end

end
