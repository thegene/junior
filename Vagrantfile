# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box'
  config.vm.box = 'centos65-x86_64-20140116'

  config.vm.synced_folder 'puppet', '/etc/puppet'
  config.vm.hostname = 'junior'

  # network settings
  config.vm.network 'forwarded_port', guest: 80, host: 4567

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  config.vm.provision :shell, path: 'puppet/install_puppet.sh'

end
