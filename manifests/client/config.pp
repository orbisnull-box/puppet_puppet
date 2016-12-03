class orbisnull_puppet::client::config inherits orbisnull_puppet::client {
    include orbisnull_puppet::client::install
    include orbisnull_puppet::client::run

    ini_setting { "orbisnull_puppet::client_config_server":
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'agent',
      setting => 'server',
      value   => $server,
      subscribe => Class['orbisnull_puppet::client::install'],
      notify => Class['orbisnull_puppet::client::run'],
    }

    puppet_uuid { "/etc/puppetlabs/puppet/puppet.conf":
      ensure  => present,
    }

    file { '/etc/puppetlabs/puppet/csr_attributes.yaml':
      ensure => file,
      mode => '0644',
      owner => 'root',
      group => 'root',
      content => template('orbisnull_puppet/client/csr_attributes.erb'),
      notify => Class['orbisnull_puppet::client::run'],
    }
}
