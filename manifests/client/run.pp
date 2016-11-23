class orbisnull_puppet::client::run inherits orbisnull_puppet::client {
    include orbisnull_puppet::client::config
    exec { 'puppet agent -t --debug --waitforcert 180':
      user=>'root',
      group=>'root',
      path=>'/bin:/usr/bin/:/usr/local/bin:/opt/puppetlabs/puppet/bin',
      refreshonly => true,
      require=>Class['orbisnull_puppet::client::config']
    }
}

