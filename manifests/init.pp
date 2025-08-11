# @summary
#  Installs and configures a web server on windows or linux systems.
#
# @param http_port
#  The port on which the web server will listen
#
class webserver (
  Pattern[/^\d+$/] $http_port = '80',
) {
  case $facts['os']['family'].downcase {
    'windows', 'debian': {
      $mod_kern = "${module_name}::${facts['kernel'].downcase}"

      include "${mod_kern}::package"
      class { "${mod_kern}::config":
        http_port => $http_port,
      }
      include webserver::service
    }
    default: {
      fail("Unsupported OS family: ${facts['os']['family']}")
    }
  }
}
