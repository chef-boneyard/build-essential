require 'spec_helper'

describe 'build-essential::default' do
  context 'Solaris' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'solaris2', version: '5.11',
                                 step_into: ['build_essential']).converge('build-essential::default')
    end

    it 'installs the correct packages' do
      expect(chef_run).to install_package('autoconf')
      expect(chef_run).to install_package('automake')
      expect(chef_run).to install_package('bison')
      expect(chef_run).to install_package('gnu-coreutils')
      expect(chef_run).to install_package('flex')
      expect(chef_run).to install_package('gcc').with_version('4.8.2')
      expect(chef_run).to install_package('gcc-c').with_version('4.8.2')
      expect(chef_run).to install_package('gcc-c++').with_version('4.8.2')
      expect(chef_run).to install_package('gnu-grep')
      expect(chef_run).to install_package('gnu-make')
      expect(chef_run).to install_package('gnu-patch')
      expect(chef_run).to install_package('gnu-tar')
      expect(chef_run).to install_package('make')
      expect(chef_run).to install_package('pkg-config')
      expect(chef_run).to install_package('ucb')
    end
  end
end
