class orbisnull_puppet::client::install inherits orbisnull_puppet::client {
    include orbisnull_puppet::repository
    include orbisnull_puppet::client::config

    package { $orbisnull_puppet::client::package_name:
      ensure    => $package_ensure,
      name      => $package_name,
      require => Class['orbisnull_puppet::repository'],
      notify => Class['orbisnull_puppet::client::config'],
    }

    package { $orbisnull_puppet::client::package_msgpack_name:
      ensure    => $package_ensure,
      name      => $package_msgpack_name,
    }

}

