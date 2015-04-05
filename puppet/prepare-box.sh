rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install -y puppet-3.7.5

# install puppet modules directly for now. Shoule be an in-puppet way to do this
puppet module install jfryman-nginx --version 0.2.5 --modulepath /usr/share/puppet/modules/
