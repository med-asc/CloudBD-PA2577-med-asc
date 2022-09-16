# Execute apt-get update
exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

# Alt 1: Force packages install after apt-update
Exec["apt-update"] -> Package <| |>

# Nodesource
exec { 'nodesource':
    require => Exec['apt-update'],
    command => '/usr/bin/curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -'
}

# # Install NPM
package { 'npm':
  # Alt 2: Force apt-update to be installed before
  require => Exec['apt-update'],
  ensure => 'installed',
}

# # Install NodeJS
package { 'nodejs':
  # Alt 2: Force apt-update to be installed before
  require => Exec['apt-update'],
  ensure => 'installed',
}
