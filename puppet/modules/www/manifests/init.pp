class www($domain = 'localhost') {
  $mod_version = '0.2.5'
  include nginx

  group { 'nginx':
    ensure => 'present'
  }

  user { 'nginx':
    groups => 'nginx',
    require => Group['nginx']
  }

  file { ['/var/www', '/var/www/apps']:
    ensure => 'directory',
    owner => 'nginx',
    group => 'nginx',
    mode => '755',
    require => User['nginx']
  }
}
