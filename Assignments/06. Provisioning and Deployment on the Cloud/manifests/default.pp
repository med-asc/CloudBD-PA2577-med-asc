# Execute apt-get update
exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

# AppServer
class app {
  # Install npm
  package { 'npm':
    require => Exec['apt-update'], 
    ensure => 'installed'
  }

  # Install Nodejs
  package { 'nodejs':
    require => Exec['apt-update'], 
    ensure => 'installed'
  }
}

# DBServer
class db {
  # Install mysql-server
  package { 'mysql-server':
    require => Exec['apt-update'], 
    ensure => 'installed'
  }

  # Run mysql
  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server']
  }
}

node /^(appserver)(.localdomain)?/ {
  class { 'app': }
}

node /^(dbserver)(.localdomain)?/ {
  class { 'db': }
}
