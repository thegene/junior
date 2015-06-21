class web_servers($domain = 'localhost') {
  package { 'epel-release':
    ensure => 'present',
    before => Package['nginx']
  }

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

  file { ['/var/www', '/data', '/data/apps', '/data/log', '/data/log/nginx']:
    ensure => 'directory',
    owner => 'deploy',
    group => 'deploy',
    mode => '755',
    require => User['deploy'],
    before => File['/var/www/apps']
  }

  file { '/var/www/apps':
    ensure => 'link',
    target => '/data/apps',
    group => 'deploy',
    owner => 'deploy',
  }

  file { '/var/log/nginx':
    ensure => 'link',
    target => '/data/log/nginx',
    group => 'deploy',
    owner => 'deploy',
    force => true,
    require => File['/var/www/apps']
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
    path => "/etc/nginx/conf.d/${fqdn}.conf",
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