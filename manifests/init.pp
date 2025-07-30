# @summary
#  Installs and configures a web server on windows or linux systems.
#
# @param http_port
#  The port on which the web server will listen
#
class webserver (
  String $http_port = '80',
) {
  if $facts['os']['name'] == 'windows' {
    include webserver::windows::package
    class { 'webserver::windows::config': http_port => $http_port, }
    include webserver::service

    Class['webserver::windows::package']
    -> Class['webserver::windows::config']
    ~> Class['webserver::service']
  }
  elsif $facts['os']['name'] == 'Ubuntu' {
    include webserver::linux::package
    class { 'webserver::linux::config': http_port => $http_port, }
    include webserver::service

    Class['webserver::linux::package']
    -> Class['webserver::linux::config']
    ~> Class['webserver::service']
  }
  else {
    fail("Unsupported OS : ${facts['os']['name']}")
  }
}
