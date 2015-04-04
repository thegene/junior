class nginx($domain = 'localhost') {
  $mod_version = '0.2.5'

  group { 'nginx':
    ensure => 'present'
  }

  user { 'nginx':
    groups => 'nginx',
    require => Group['nginx']
  }

  exec { "ensure-external-module":
    command => "puppet module install jfryman-nginx --version ${mod_version} --modulepath ${common::modulepath}",
    path => '/usr/bin:/bin',
    unless => "puppet module list | grep jfryman-nginx | grep 0.2.5",
  }

  file { ['/var/www', '/var/www/apps']:
    ensure => 'directory',
    owner => 'nginx',
    group => 'nginx',
    mode => '755',
    require => User['nginx']
  }

  # file { 'apps_directory':
  #   path => '/var/www/apps/',
  #   ensure => 'directory',
  #   owner => 'nginx',
  #   group => 'nginx',
  #   mode => '755',
  #   require => File['/var/www']
  # }

}