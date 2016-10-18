class java_install {

	file {'jdk':
      ensure => present,
      path   => '/tmp/jdk.rpm',
	  owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0644',
      source => 'puppet:///modules/java_install/jdk-8u101-linux-x64.rpm',
    }
	
	package { 'jdk1.8.0_101.x86_64':
      provider => 'rpm' ,
      ensure => 'present' ,
      source => '/tmp/jdk.rpm'
    }
	
    file_line { 'java_home_rule':
        path   => '/home/vagrant/.bashrc',
        ensure => present,
        match  => 'export JAVA_HOME',
        line   => 'export JAVA_HOME=/usr/java/latest'
    }
	
}
