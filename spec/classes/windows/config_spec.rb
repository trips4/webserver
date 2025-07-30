# frozen_string_literal: true

require 'spec_helper'

describe 'webserver::windows::config' do
  let(:facts) do
    {
      os: {
        'name'   => 'Windows',
        'family' => 'windows',
      },
      webserver_http_port: '80',
    }
  end

  let(:params) do
    {
      http_port: '8080',
    }
  end

  it { is_expected.to compile.with_all_deps }

  it do
    is_expected.to contain_exec('Set IIS to listen on port 8080')
      .with(
        command:  "Import-Module WebAdministration; Set-WebBinding -Name 'Default Web Site' -BindingInformation '*:80:' -PropertyName Port -Value 8080",
        unless:   "if ((Get-WebBinding -Protocol 'http').bindingInformation -match ':8080:') {exit 0} else {exit 1}",
        provider: 'powershell',
      )
  end
end
