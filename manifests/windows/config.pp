# @summary
#   This class is used to configure IIS settings on the Windows platform.
#
# @api private
class webserver::windows::config (
  String $http_port,
) {
  $current_http_port = $facts['webserver_http_port']

  exec { "Set IIS to listen on port ${http_port}":
    command  => "Import-Module WebAdministration; Set-WebBinding -Name 'Default Web Site' -BindingInformation '*:${current_http_port}:' -PropertyName Port -Value ${http_port}",
    unless   => "if ((Get-WebBinding -Protocol 'http').bindingInformation -match ':${http_port}:') {exit 0} else {exit 1}",
    provider => 'powershell',
  }
}
