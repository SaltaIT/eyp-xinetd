class xinetd(
              $manage_package         = true,
              $package_ensure         = 'installed',
              $manage_service         = true,
              $manage_docker_service  = true,
              $service_ensure         = 'running',
              $service_enable         = true,
              $purge_unmanaged_config = true,
              $xinetd_confd_ensure = 'directory',
            ) inherits xinetd::params{

  class { '::xinetd::install': }
  -> class { '::xinetd::config': }
  ~> class { '::xinetd::service': }
  -> Class['::xinetd']

}
