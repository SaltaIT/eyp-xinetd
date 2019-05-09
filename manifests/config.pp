class xinetd::config inherits xinetd {

  file { '/etc/xinetd.d/':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    purge   => $xinetd::purge_unmanaged_config,
    recurse => $xinetd::purge_unmanaged_config,
  }

}
