class enigma::config inherits enigma {
	require ::enigma::extract

    file_line { 'as1_ip_rule':
		path => $installer_cfg,
		ensure => present,
		match => '^ENIGMA_AS1',
		line => "ENIGMA_AS1=${hostname}",
    }

	file_line { 'enigma_home_rule':
			path => $installer_cfg,
			ensure => present,
			match => '^ENIGMA_HOME',
			line => 'ENIGMA_HOME=/home/vagrant/enigma',
	}

	file_line { 'enigma_datastore_rule':
			path => $installer_cfg,
			ensure => present,
			match => '^ENIGMA_DATASTORE_BASE',
			line => 'ENIGMA_DATASTORE_BASE=/home/vagrant/enigma/hdfs',
	}

	file_line { 'enigma_datastore_delete_rule':
			path => $installer_cfg,
			ensure => present,
			match => '^#ENIGMA_DATASTORE_DELETEOLD',
			line => 'ENIGMA_DATASTORE_DELETEOLD=true',
	}

	file_line { 'enigma_ingress_dir_rule':
			path => $installer_cfg,
			ensure => present,
			match => '^ENIGMA_INGRESS_BASE',
			line => 'ENIGMA_INGRESS_BASE=/home/vagrant/ingress',
	}
	file { ["/home/vagrant/ingress" ]:
		ensure => 'directory',
		owner => 'vagrant',
		group => 'vagrant',
	}
	
	file_line { 'enigma_env_rule':
		path => '/home/vagrant/.bashrc',
		ensure => present,
		match => '. ~/enigma/env-enigma',
		line => 'test -f ~/enigma/env-enigma && . ~/enigma/env-enigma'
	}
	
	file_line { 'java_home_rule_in_cfg':
		path => $installer_cfg,
		ensure => present,
		match => '^JAVA_HOME=',
		line => 'JAVA_HOME=/usr/java/latest',
    }
	
	exec { 'install_apache_repo':
	    command => '/usr/bin/wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo',
		creates => "/etc/yum.repos.d/epel-apache-maven.repo",
    }
	
	exec { 'update_apache_repo':
	    command => '/bin/sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo',
		require => Exec['install_apache_repo'],
    }
}