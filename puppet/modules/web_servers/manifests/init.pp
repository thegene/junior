class web_servers($domain = 'localhost') {
  include www

  web_servers::server { 'wedding':
    app_name => 'wedding'
  }

}

define web_servers::server($app_name) {
  $app_root = "/var/www/apps/${app_name}"


  file { "${app_name}_directory":
    path => $app_root,
    ensure => 'directory',
    owner => 'deploy',
    group => 'deploy',
    mode => '755',
  }

  nginx::resource::vhost { "${app_name}.${web_servers::domain}":
    www_root => "${app_root}/current",
  }
}