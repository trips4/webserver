# @summary
#   This class is used to configure apache2 settings on the Linux platform.
#
# @api private
class webserver::linux::config (
  String $http_port,
) {
  $current_http_port = $facts['webserver_http_port']

  exec { "update /etc/apache2/ports.conf to Listen on ${http_port}":
    command  => "sed -i 's/^Listen ${current_http_port}$/Listen ${http_port}/' /etc/apache2/ports.conf",
    unless   => "grep -q '^Listen ${http_port}$' /etc/apache2/ports.conf",
    provider => 'shell',
  }
}
