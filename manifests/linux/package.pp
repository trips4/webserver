# @summary
#   This class is used to manage the apache2 package on Ubuntu systems.
#
# @api private
class webserver::linux::package {
  package { 'apache2':
    ensure => 'present',
  }
}
