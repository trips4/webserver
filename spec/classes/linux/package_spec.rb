# frozen_string_literal: true

# require 'spec_helper'

# describe 'webserver::linux::package' do
#   on_supported_os.each do |os, os_facts|
#     context "on #{os}" do
#       let(:facts) { os_facts }

#       it { is_expected.to compile.with_all_deps }
#     end
#   end
# end

require 'spec_helper'

describe 'webserver::linux::package' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it do
        is_expected.to contain_package('apache2').with(
          ensure: 'present',
        )
      end
    end
  end
end
