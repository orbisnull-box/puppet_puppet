class orbisnull_puppet::repository inherits orbisnull_puppet {
  apt::source { 'puppet-source':
  location => 'http://apt.puppetlabs.com',
  release  => 'jessie',
  repos    => 'PC1',
  key      => {
    'id'     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
    'server' => 'pgp.mit.edu',
  },
}
}
