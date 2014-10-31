node 'vm-webhost-01.cca.edu' {
  #ntp module for correct time
  class { '::ntp':
    servers => [ 'ntp1.cca.edu', 'ntp2.cca.edu' ],
  }
}
