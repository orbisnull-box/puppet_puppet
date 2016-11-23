class orbisnull_puppet::client::params {
    $package_ensure = 'latest'
    $package_name   = 'puppet-agent'
    $package_msgpack_name   = 'ruby-msgpack'
    $waitforcert = '120'
    $server = 'puppet.local'
}
