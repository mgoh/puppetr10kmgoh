node 'vm-webhost-01.cca.edu' {
  #ntp module for correct time
  class { '::ntp':
    servers => [ 'ntp1.cca.edu', 'ntp2.cca.edu' ],
  }
  class { '::apache':
    mpm_module => 'prefork'
  }
  apache::vhost { 'fluffy.cca.edu':
    port       => '80',
    docroot    => '/opt/www/fluffy',
  }
  class {'::apache::mod::php':
    package_name => "php54-php",
    path         => "${::apache::params::lib_path}/libphp54-php5.so",
  }
}
