# @summary
#   This class is used to configure apache2 settings on the Linux platform.
#
# @api private
class webserver::linux::config (
  String $http_port,
) {
  file_line { '/etc/apache2/ports.conf':
    ensure  => present,
    path    => '/etc/apache2/ports.conf',
    line    => "Listen ${http_port}",
    match   => "^Listen\\s+",
    replace => true,
    require => Class['webserver::linux::package'],
    notify  => Class['webserver::service'],
  }
}
