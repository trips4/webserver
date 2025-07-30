# frozen_string_literal: true

require 'spec_helper'

describe 'webserver::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:params) do
        {
          service_name:,
        }
      end

      context 'on Ubuntu with apache2' do
        let(:service_name) { 'apache2' }

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_service('apache2')
            .with(
              ensure: 'running',
              enable: true,
            )
        end
      end

      context 'on Windows with IIS' do
        let(:service_name) { 'W3SVC' }

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_service('W3SVC')
            .with(
              ensure: 'running',
              enable: true,
            )
        end
      end
    end
  end
end
