require 'spec_helper'

describe 'riak2' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "riak2 class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('riak2::params') }
          it { is_expected.to contain_class('riak2::install').that_comes_before('riak2::config') }
          it { is_expected.to contain_class('riak2::config').that_comes_before('riak2::service') }

          it { is_expected.to contain_service('riak').with({
            'ensure' => nil,
            'enable' => true,
          })}
          it { is_expected.to contain_package('riak').with_ensure('2.0.5-1') }
        end

        context "riak2 class with any parameters" do
          let(:params) {{
            :version            => '2.0.5-1',
            :disableboot        => true,
            :manage_service     => false,
            :platform_log_dir   => '/tmp/log_dir',
            :platform_data_dir  => '/tmp/data_dir',
            :user               => 'riak',
            :group              => 'riak'
            }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_file('/tmp/log_dir').with({
            'ensure'   => 'directory',
            'owner'   => 'riak',
            'group'   => 'riak',
          })}

          it { is_expected.to contain_file('/tmp/data_dir').with({
            'ensure'   => 'directory',
            'owner'   => 'riak',
            'group'   => 'riak',
          })}

          it { is_expected.to contain_package('riak').with_ensure('2.0.5-1') }

          it { is_expected.to contain_service('riak').with({
            'ensure' => nil,
            'enable' => false,
          })}
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'riak2 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
        :ipaddress       => '127.0.0.1',
      }}

      it { expect { is_expected.to contain_package('riak') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
