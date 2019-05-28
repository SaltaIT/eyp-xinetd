class xinetd::config inherits xinetd {

  if($xinetd::package_ensure=='absent')
  {
    file { '/etc/xinetd.d/':
      ensure  => 'directory',
      purge   => $xinetd::purge_unmanaged_config,
      recurse => $xinetd::purge_unmanaged_config,
    }
  }
  else
  {
    file { '/etc/xinetd.d/':
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      purge   => $xinetd::purge_unmanaged_config,
      recurse => $xinetd::purge_unmanaged_config,
    }
  }
}
