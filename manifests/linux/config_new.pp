# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include webserver::linux::config_new
class webserver::linux::config_new {
  file_line { '/etc/apache2/ports.conf':
    ensure  => present,
    line    => "Listen ${http_port}",
    path    => '/etc/apache2/ports.conf',
    match   => '^Listen\s+\d+$',
    replace => false,
  }
}
