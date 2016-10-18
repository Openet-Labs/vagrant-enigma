class enigma::install inherits enigma {
	require ::enigma::config
	
	exec { 'install_framework':
	    command => '/bin/bash /home/vagrant/enigma_installers/enigma-framework-installer/bin/install-enigma-framework.sh',
    }
	exec { 'install_file_reader':
	    command => "bash -c 'source /home/vagrant/enigma/env-enigma && /home/vagrant/enigma_installers/enigma-FileReader-installer/bin/install-enigma-FileReader.sh'",
		path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
		require => Exec['install_framework'],
    }
	exec { 'install_jobs_executor':
	    command => "bash -c 'source /home/vagrant/enigma/env-enigma && /home/vagrant/enigma_installers/enigma-JobsExecutor-installer/bin/install-enigma-JobsExecutor.sh'",
		path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
		require => Exec['install_file_reader'],
    }
	/*
	exec { 'install_usecases':
	    command => "bash -c 'source /home/vagrant/enigma/env-enigma && /home/vagrant/enigma_installers/enigma-usecases-installer/bin/install-enigma-usecases.sh'",
		path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin', 
		require => Exec['install_jobs_executor'],
    }
	*/
}