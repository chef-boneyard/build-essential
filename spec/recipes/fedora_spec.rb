require 'spec_helper'

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'fedora', version: '23',
                               step_into: ['build_essential']).converge('build-essential::default')
  end

  it 'installs the correct packages' do
    expect(chef_run).to install_package(['autoconf', 'bison', 'flex', 'gcc', 'gcc-c++', 'gettext', 'kernel-devel', 'make', 'm4', 'ncurses-devel', 'patch'])
  end
end
