class enigma {

	require ::java_install
	
	$installer_cfg='/home/vagrant/enigma_installers/enigma-framework-installer/bin/install-enigma-framework.cfg'
	
	ssh_keygen { 
	    'vagrant':
    }
    exec { 'setup_passwordless_ssh_to_localhost':
	    command => '/bin/cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys',
	    require => Ssh_keygen["vagrant"]
    }
	
	contain enigma::extract
	contain enigma::config
	contain enigma::install
	contain enigma::service
	
}
