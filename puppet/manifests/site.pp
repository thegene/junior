node 'dev-junior' {
  include deploy_user
  class { 'web_servers':
    version => '1.0.15-11.el6',
    domain => 'eugenewestbrook.dev'
  }
}

node 'junior-ec2' {
  include deploy_user
  class { 'web_servers':
    version => '1.6.2-1.23.amzn1',
    domain => 'eugenewestbrook.com'
  }
}