# @summary
#   This class is used to install the IIS feature on Windows platform.
#
# @api private
class webserver::windows::package {
  exec { 'Install IIS':
    command  => 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools',
    unless   => 'if((Get-WindowsFeature -Name Web-Server).InstallState -eq "installed") { exit 0 } else { exit 1 }',
    provider => 'powershell',
  }
}
