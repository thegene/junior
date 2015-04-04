class web_servers {
  include nginx

  web_servers::server { 'wedding':
    app_name => 'wedding',
    require => File['/var/www/apps']
  }

}

define web_servers::server($app_name) {
  file { "${app_name}_directory":
    path => "/var/www/apps/${app_name}",
    ensure => 'directory',
    owner => 'nginx',
    group => 'nginx',
    mode => '755',
  }
}