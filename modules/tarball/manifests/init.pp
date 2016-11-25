define remote_file($remote_location=undef, $mode='0644'){
  exec{"retrieve_${title}":
    timeout => 0,
    command => "/usr/bin/wget -q ${remote_location} -O ${title}",
    creates => $title,
  }

  file{$title:
    mode    => $mode,
    require => Exec["retrieve_${title}"],
  }
}
define tarball(
    $module_name, 
	$install_dir, 
	$user_name, 
	$group_name,
	$tarball_file_url = '') {

	if($tarball_file_url == '') {
        file { "download file $title":
            path    => "/tmp/$title",
            source  => "puppet:///modules/$module_name/$title",
		    owner   => 'vagrant',
            group   => 'vagrant',
            mode    => '0644',
		    ensure  => present
        }
	} else {
		remote_file{"/tmp/$title":
            remote_location => "$tarball_file_url",
            mode            => '0755',
        }
	}
	
	exec { "change_owner $title":
		   command => "/bin/chown -R $user_name:$group_name $install_dir",
		   require => Exec["untar $title"]
   }
    if($tarball_file_url == '') {
		# untar the tarball at the desired location
		exec { "untar $title":
			command => "/bin/mkdir -p $install_dir; /bin/tar xzvf /tmp/$title -C $install_dir/",
			require => File["download file $title"],
		} 
	} else {
		# untar the tarball at the desired location
		exec { "untar $title":
			command => "/bin/mkdir -p $install_dir; /bin/tar xzvf /tmp/$title -C $install_dir/",
			require => remote_file["/tmp/$title"],
		}
	}
}