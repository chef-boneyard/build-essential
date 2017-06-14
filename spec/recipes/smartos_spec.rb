require 'spec_helper'

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'smartos', version: '5.11',
                               step_into: ['build_essential']).converge('build-essential::default')
  end

  it 'installs the correct packages' do
    expect(chef_run).to install_package('autoconf')
    expect(chef_run).to install_package('binutils')
    expect(chef_run).to install_package('build-essential')
    expect(chef_run).to install_package('gcc47')
    expect(chef_run).to install_package('gmake')
    expect(chef_run).to install_package('pkg-config')
  end
end
