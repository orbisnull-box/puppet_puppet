class orbisnull_puppet::utils inherits orbisnull_puppet {
  package { 'crudini' :
    ensure => latest,
  }
}
