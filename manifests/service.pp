# @summary
#   This class is for managing the web service on Both Windows & Ubuntu systems.
# @api private
class webserver::service (
  String $service_name = 'webservice',
) {
  service { #$service_name :
    ensure => 'running',
    enable => true,
  }
}
