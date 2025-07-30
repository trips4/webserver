# frozen_string_literal: true

require 'spec_helper'

describe 'webserver::linux::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts.merge({
                         webserver_http_port: '80',
                       })
      end

      let(:params) do
        {
          http_port: '8080',
        }
      end

      it { is_expected.to compile.with_all_deps }

      it do
        is_expected.to contain_exec('update /etc/apache2/ports.conf to Listen on 8080')
          .with(
            command:  "sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf",
            unless:   "grep -q '^Listen 8080$' /etc/apache2/ports.conf",
            provider: 'shell',
          )
      end
    end
  end
end
