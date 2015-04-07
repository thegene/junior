node 'dev-junior' {
  include deploy_user
  class { 'web_servers':
    domain => 'eugenewestbrook.com'
  }


}