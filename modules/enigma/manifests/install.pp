class enigma::install inherits enigma {
	require ::enigma::config
	
	exec { 'install_framework':
	    command => '/bin/bash /home/vagrant/enigma_installers/enigma-framework-installer/bin/install-enigma-framework.sh',
		user    => 'vagrant',
		creates => "/home/vagrant/enigma",
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