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
      $mod_fam = "${module_name}::${facts['os']['family'].downcase}"

      include "${mod_fam}::package"
      class { "${mod_fam}::config":
        http_port => $http_port,
      }
      include webserver::service
    }
    default: {
      fail("Unsupported OS family: ${facts['os']['family']}")
    }
  }
}
