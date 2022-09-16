# Execute apt-get update
exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}
