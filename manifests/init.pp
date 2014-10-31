node 'vm-webhost-01.cca.edu' {
  class { '::ntp':
  servers => [ 'ntp1.cca.edu', 'ntp2.cca.edu' ],
}
}
