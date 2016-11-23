class orbisnull_puppet::client (
  $package_ensure    = $orbisnull_puppet::client::params::package_ensure,
  $package_name      = $orbisnull_puppet::client::params::package_name,
  $server      = $orbisnull_puppet::client::params::server,
  $waitforcert = $orbisnull_puppet::client::params::waitforcert,
  $psk,
) inherits orbisnull_puppet::client::params {
  validate_string($package_ensure)
  validate_string($package_name)
  validate_string($server)
  validate_string($waitforcert)
  validate_string($psk)

  contain 'orbisnull_puppet::client::install'
  contain 'orbisnull_puppet::client::config'

}
