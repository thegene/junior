class nginx($domain = 'localhost') {
  $mod_version = '0.2.5'

  exec { "ensure-external-module":
    command => "puppet module install jfryman-nginx --version ${mod_version} --modulepath ${common::modulepath}",
    path => '/usr/bin:/bin',
    unless => "puppet module list | grep jfryman-nginx | grep 0.2.5",
  }

  file { ['/var/www', '/var/www/apps']:
    ensure => 'directory',
    owner => 'nginx',
    group => 'nginx',
    mode => '755'
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