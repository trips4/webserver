# frozen_string_literal: true

require 'spec_helper'

describe 'webserver::linux::config' do
  on_supported_os.select { |_os, facts| facts[:os]['name'] == 'Ubuntu' }.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:params) do
        {
          http_port: '8080',
        }
      end

      it { is_expected.to compile.with_all_deps }
    end
  end
end
