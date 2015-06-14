# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = 'https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box'
  config.vm.box = 'centos-6.6-x86_64'

  config.vm.synced_folder 'puppet', '/etc/puppet'
  config.vm.synced_folder 'data', '/data/apps'
  config.vm.hostname = 'dev-junior'

  config.vm.network 'private_network', ip: '192.168.100.100'

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  # config.vm.provision :shell, path: 'puppet/prepare-box.sh'
  # config.vm.provision :shell, path: 'puppet/apply.sh'

end
