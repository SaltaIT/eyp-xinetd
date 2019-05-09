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

# protocol                = <%= @protocol %>
# user                    = <%= @user %>
# server                  = <%= @server %>
# server_args             = <%= @server_args %>
# per_source              = <%= @per_source %>
# cps                     = <%= @max_cps %> <%= @cps_bantime %>
# flags                   = <%= @flags %>

xinetd::daemon { 'tftp':
  description => 'TFTP daemon'
  protocol    => 'udp',
  user        => 'root',
  server      => '/usr/sbin/in.tftpd',
  server_args => '-c -v -u tftp -p -U 117 -s /tftpdata',
  per_source  => '11',
  max_cps     => '100',
  cps_bantime => '2',
  flags       => 'IPv4',
}
