class deploy_user {

  file { '/etc/sudoers.d/deploy':
    content => '%deploy ALL = (ALL) NOPASSWD: ALL',
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '750',
    require => Group['deploy']
  }

  group { 'deploy':
    ensure => 'present'
  }

  user { 'deploy':
    groups => 'deploy',
    require => Group['deploy']
  }

  file { ['/home/deploy', '/home/deploy/.ssh']:
    group => 'deploy',
    owner => 'deploy',
    ensure => 'directory'
  }
}