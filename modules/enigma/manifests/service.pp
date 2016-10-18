class enigma::service inherits enigma {

    service { "iptables":
		ensure => stopped
	}
	
}