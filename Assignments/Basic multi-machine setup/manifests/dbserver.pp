# Execute apt-get update
exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

# Force apt-update to run before packages
Exec["apt-update"] -> Package <| |>

# Install mysql-server
package { 'mysql-server':
    require => Exec['apt-update'],
    ensure => 'installed',
}

# Run mysql
service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
}
