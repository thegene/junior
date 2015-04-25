class web_servers($domain = 'localhost') {

  package { 'nginx':
    ensure => '1.0.15-11.el6',
    require => File['/var/www/apps']
  }

  service { 'nginx':
    ensure => 'running',
    require => Package['nginx']
  }

  file { ['/etc/nginx/conf.d/default.conf',
          '/etc/nginx/conf.d/ssl.conf',
          '/etc/nginx/conf.d/virtual.conf']:
    ensure => 'absent',
    require => Package['nginx']
  }

  file { ['/var/www', '/var/www/apps']:
    ensure => 'directory',
    owner => 'deploy',
    group => 'deploy',
    mode => '755',
    require => User['deploy']
  }

  web_servers::server { 'wedding':
    app_name => 'wedding',
    domain => $domain,
    notify => Service['nginx']
  }

}

define web_servers::server($app_name, $domain) {
  $fqdn = "${app_name}.${domain}"
  $app_root = "/var/www/apps/${fqdn}"

  file { "${app_name}_directory":
    path => $app_root,
    ensure => 'directory',
    owner => 'deploy',
    group => 'deploy',
    mode => '755',
  }

  file { "${app_name}-host":
    path => "/etc/nginx/conf.d/${app_name}.conf",
    content => template('web_servers/host.erb'),
    mode => '755',
    owner => 'nginx'
  }

  file { "/var/log/nginx/${fqdn}":
    ensure => 'directory',
    mode => '755',
    owner => 'nginx',
    group => 'nginx'
  }
}