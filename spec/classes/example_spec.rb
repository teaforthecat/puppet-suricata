require 'spec_helper'

describe 'suricata' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "suricata class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('suricata::params') }
        it { should contain_class('suricata::install').that_comes_before('suricata::config') }
        it { should contain_class('suricata::config') }
        it { should contain_class('suricata::service').that_subscribes_to('suricata::config') }

        it { should contain_service('suricata') }
        it { should contain_package('suricata').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'suricata class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('suricata') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
