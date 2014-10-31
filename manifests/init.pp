node 'vm-webhost-01.cca.edu' {
  #ntp module for correc time
  include '::ntp'
    class { '::ntp':
    servers => [ 'ntp1.cca.edu', 'ntp2.cca.edu' ],
  }
  #apache setup
  apache::vhost { 'wwwtest1.cca.edu':
    port    => '80',
    docroot => '/opt/www/first',
  }
}
