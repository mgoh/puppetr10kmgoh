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
    package_name => "php5",
    path         => "${::apache::params::lib_path}/libphp5.so",
  }
}
node 'vm-webhost-02.cca.edu' {
  #ntp module for correct time
  class { '::ntp':
    servers => [ 'ntp1.cca.edu', 'ntp2.cca.edu' ],
  }
  class { '::apache':
    mpm_module => 'prefork'
  }
  apache::vhost { 'precious.cca.edu':
    port       => '80',
    docroot    => '/opt/www/precious',
  }
  class {'::apache::mod::php':
    package_name => "php5",
    path         => "${::apache::params::lib_path}/libphp5.so",
  }
}

node 'vm-mysql-07.cca.edu' {
  #ntp module for correct time
  class { '::ntp':
    servers => [ 'ntp1.cca.edu', 'ntp2.cca.edu' ],
  }
  #mysql server
  class { '::mysql::server':
    #initial password; changes this asap
    root_password    => 'nottherealpassword',
    override_options => { 'mysqld' => { 'max_connections' => '1024' } }
  } 
} 
