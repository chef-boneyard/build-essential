require 'spec_helper'

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'debian', version: '8.4',
                               step_into: ['build_essential']).converge('build-essential::default')
  end

  it 'installs the correct packages' do
    expect(chef_run).to install_package(['autoconf', 'binutils-doc', 'bison', 'build-essential', 'flex', 'gettext', 'ncurses-dev'])
  end
end
