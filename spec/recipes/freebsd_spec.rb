require 'spec_helper'

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'freebsd', version: '10.3',
                               step_into: ['build_essential']).converge('build-essential::default')
  end

  it 'installs the correct packages' do
    expect(chef_run).to install_package('devel/gmake')
    expect(chef_run).to install_package('devel/autoconf')
    expect(chef_run).to install_package('devel/m4')
    expect(chef_run).to install_package('devel/gettext')
  end
end

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'freebsd', version: '9.3',
                               step_into: ['build_essential']).converge('build-essential::default')
  end

  it 'installs the correct packages' do
    expect(chef_run).to install_package('devel/gmake')
    expect(chef_run).to install_package('devel/autoconf')
    expect(chef_run).to install_package('devel/m4')
    expect(chef_run).to install_package('devel/gettext')
    expect(chef_run).to install_package('lang/gcc49')
  end
end
