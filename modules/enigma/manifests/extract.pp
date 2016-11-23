class enigma::extract inherits enigma {

	$my_module_name = "enigma"
	$base_url = "http://accelerate.openet.com/enigma-files/"
    tarball { "enigma-framework-installer.tgz":
        module_name      => "$my_module_name",
        install_dir      => "/home/vagrant/enigma_installers",
		tarball_file_url => "$base_url/enigma-framework-installer.tgz",
		user_name        => "vagrant",
		group_name       => "vagrant",
    }
	
	file { "create downloads dir":
        path    => "/home/vagrant/enigma_installers/enigma-framework-installer/Downloads",
		owner   => 'vagrant',
        group   => 'vagrant',
        mode    => '0644',
		ensure  => present,
		require => Tarball["enigma-framework-installer.tgz"]
    } 
	
	tarball { "3rdPartyInstallers.tar.gz":
        module_name      => "$my_module_name",
        install_dir      => "/home/vagrant/enigma_installers/enigma-framework-installer/Downloads",
		tarball_file_url => "$base_url/3rdPartyInstallers.tar.gz",
		user_name        => "vagrant",
		group_name       => "vagrant",
		require          => Tarball["enigma-framework-installer.tgz"]
    }
	tarball { "enigma-FileReader-installer.tgz":
        module_name      => "$my_module_name",
        install_dir      => "/home/vagrant/enigma_installers",
		tarball_file_url => "$base_url/enigma-FileReader-installer.tgz",
		user_name        => "vagrant",
		group_name       => "vagrant",
    }
	
	tarball { "enigma-JobsExecutor-installer.tgz":
	    module_name      => "$my_module_name",
        install_dir      => "/home/vagrant/enigma_installers",
		tarball_file_url => "$base_url/enigma-JobsExecutor-installer.tgz",
		user_name        => "vagrant",
		group_name       => "vagrant",
	}
	
	package {
		["nc", "dos2unix"] :
		ensure => installed,
	}
	
	
}