class xinetd::service inherits xinetd {

  #
  validate_bool($xinetd::manage_docker_service)
  validate_bool($xinetd::manage_service)
  validate_bool($xinetd::service_enable)

  validate_re($xinetd::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${xinetd::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $xinetd::manage_docker_service)
  {
    if($xinetd::manage_service)
    {
      service { $xinetd::params::service_name:
        ensure => $xinetd::service_ensure,
        enable => $xinetd::service_enable,
      }
    }
  }
}
