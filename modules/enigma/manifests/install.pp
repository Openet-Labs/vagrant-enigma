class enigma::install inherits enigma {
	require ::enigma::config
	
	exec { 'install_framework':
	    command => '/bin/bash /home/vagrant/enigma_installers/enigma-framework-installer/bin/install-enigma-framework.sh',
		user    => 'vagrant',
		creates => "/home/vagrant/enigma",
    }
        file_line { 'install_yarnchange':
		path => '/home/vagrant/enigma/hadoop/hadoop-2.6.0/etc/hadoop/yarn-site.xml',
		ensure => present,
		require => Exec['install_framework'],
		line => "<value>0.0.0.0</value>",
		match => '<value>enigma</value>',
    }
	exec { 'install_file_reader':
	    command => "bash -c 'source /home/vagrant/enigma/env-enigma && /home/vagrant/enigma_installers/enigma-FileReader-installer/bin/install-enigma-FileReader.sh'",
		path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
		require => Exec['install_framework'],
		user    => 'vagrant',
		creates => "/home/vagrant/enigma",
    }
	exec { 'install_jobs_executor':
	    command => "bash -c 'source /home/vagrant/enigma/env-enigma && /home/vagrant/enigma_installers/enigma-JobsExecutor-installer/bin/install-enigma-JobsExecutor.sh'",
		path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
		require => Exec['install_file_reader'],
		user    => 'vagrant',
		creates => "/home/vagrant/enigma",
    }
	
	package {
		["apache-maven", "git"] :
		ensure => installed,
	}
}