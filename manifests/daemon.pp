# # vi /etc/xinetd.d/tftp
#
# # default: off
# # description: The tftp server serves files using the trivial file transfer
# #       protocol.  The tftp protocol is often used to boot diskless
# #       workstations, download configuration files to network-aware printers,
# #       and to start the installation process for some operating systems.
# service tftp
# {
#         socket_type             = dgram
#         protocol                = udp
#         wait                    = yes
#         user                    = root
#         server                  = /usr/sbin/in.tftpd
#         server_args             = -c -v -u tftp -p -U 117 -s /tftpdata
#         disable                 = disable
#         per_source              = 11
#         cps                     = 100 2
#         flags                   = IPv4
# }

# # This is for quick on or off of the service
# 	disable		= yes
#
# # The next attributes are mandatory for all services
# 	id		= time-dgram
# 	type		= INTERNAL
# 	wait		= yes
# 	socket_type	= dgram

define xinetd::daemon (
                        $daemon_name = $name,
                        $description = undef,
                        $disable     = false,
                        $id          = $name,
                        $type        = 'INTERNAL',
                        $socket_type = 'dgram',
                        $protocol    = undef,
                        $wait        = undef,
                        $user        = undef,
                        $server      = undef,
                        $server_args = undef,
                        $per_source  = undef,
                        $max_cps     = undef,
                        $cps_bantime = '10',
                        $flags       = undef,
                      ) {
  include ::xinetd

  file { "/etc/xinetd.d/${daemon_name}":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/daemon.erb"),
    notify  => Class['::xinetd::service'],
  }

}
