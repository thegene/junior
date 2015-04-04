class web_servers($domain = 'localhost') {
  $mod_version = '0.2.5'

  exec { "ensure-external-module":
    command => "puppet module install jfryman-nginx --version ${mod_version} --modulepath ${common::modulepath}",
    path => '/usr/bin:/bin',
    unless => "puppet module list | grep jfryman-nginx | grep 0.2.5",
  }
}