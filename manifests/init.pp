class xinetd(
              $manage_package         = true,
              $package_ensure         = 'installed',
              $manage_service         = true,
              $manage_docker_service  = true,
              $service_ensure         = 'running',
              $service_enable         = true,
              $purge_unmanaged_config = true,
            ) inherits xinetd::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::xinetd::install': }
  -> class { '::xinetd::config': }
  ~> class { '::xinetd::service': }
  -> Class['::xinetd']

}
