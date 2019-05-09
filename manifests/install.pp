class xinetd::install inherits xinetd {

  if($xinetd::manage_package)
  {
    package { $xinetd::params::package_name:
      ensure => $xinetd::package_ensure,
    }
  }

}
