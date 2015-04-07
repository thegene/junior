class deploy_user {
  group { 'deploy':
    ensure => 'present'
  }

  user { 'deploy':
    groups => 'deploy',
    require => Group['deploy']
  }
}