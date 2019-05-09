class xinetd::service inherits xinetd {

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
