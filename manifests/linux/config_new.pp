# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include webserver::linux::config_new
class webserver::linux::config_new {
  $http_port = 8000

  notify { "The REGEX IS ^Listen\\s+\\${http_port}$":
  }

  file_line { '/etc/apache2/ports.conf':
    ensure  => present,
    line    => "Listen ${http_port}",
    path    => '/etc/apache2/ports.conf',
    match   => "^Listen\\s+\\${http_port}$",
    replace => false,
  }
}
