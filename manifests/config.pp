class xinetd::config inherits xinetd {

  file { '/etc/xinetd.d/':
    ensure  => $xinetd::xinetd_confd_ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    purge   => $xinetd::purge_unmanaged_config,
    recurse => $xinetd::purge_unmanaged_config,
  }

}
