# frozen_string_literal: true

require 'spec_helper'

describe 'webserver::linux::config_new' do
  on_supported_os.select { |_os, facts| facts[:os]['name'] == 'Ubuntu' }.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
