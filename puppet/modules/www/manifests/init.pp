class www($domain = 'localhost') {
  $mod_version = '0.2.5'
  include nginx

  file { ['/var/www', '/var/www/apps']:
    ensure => 'directory',
    owner => 'deploy',
    group => 'deploy',
    mode => '755',
    require => User['deploy']
  }
}
