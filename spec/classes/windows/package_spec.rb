# frozen_string_literal: true

require 'spec_helper'

describe 'webserver::windows::package' do
  let(:facts) do
    {
      os: {
        'name' => 'windows',
        'family' => 'windows',
      }
    }
  end

  it { is_expected.to compile.with_all_deps }

  it do
    is_expected.to contain_exec('Install IIS').with(
      command:  'Install-WindowsFeature -Name Web-Server -IncludeManagementTools',
      unless:   'if((Get-WindowsFeature -Name Web-Server).InstallState -eq "installed") { exit 0 } else { exit 1 }',
      provider: 'powershell',
    )
  end
end
