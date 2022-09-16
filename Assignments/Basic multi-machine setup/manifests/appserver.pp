# Execute apt-get update
exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

# Force apt-update to run before packages
Exec["apt-update"] -> Package <| |>

# Install npm
package { 'npm':
    ensure => 'installed'
}

# Install Nodejs
package { 'nodejs':
    ensure => 'installed'
}
