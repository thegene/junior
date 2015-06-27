yum install -y puppet3
hostname junior-ec2
rm -rf /etc/puppet
ln -s /home/ec2-user/junior/puppet /etc/puppet