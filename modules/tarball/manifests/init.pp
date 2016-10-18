define tarball($module_name, $install_dir, $user_name, $group_name) {

    file { "download file $title":
        path    => "/tmp/$title",
        source  => "puppet:///modules/$module_name/$title",
		owner  => 'vagrant',
        group  => 'vagrant',
        mode   => '0644',
		ensure => present
    }
	
	exec { "change_owner $title":
		   command => "/bin/chown -R $user_name:$group_name $install_dir",
		   require => Exec["untar $title"]
   }
    # untar the tarball at the desired location
    exec { "untar $title":
        command     => "/bin/mkdir -p $install_dir; /bin/tar xzvf /tmp/$title -C $install_dir/",
		require => File["download file $title"],
    } 
}