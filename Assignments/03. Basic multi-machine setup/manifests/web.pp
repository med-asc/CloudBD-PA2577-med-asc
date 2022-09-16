# Execute apt-get update
exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

# Force apt-update to run before packages
Exec["apt-update"] -> Package <| |>

# Install nginx
package { 'nginx':
    ensure => 'installed'
}

# Run nginx
service { 'nginx':
    ensure  => running,
    require => Package['nginx']
}
