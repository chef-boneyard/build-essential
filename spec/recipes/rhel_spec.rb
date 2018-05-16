require 'spec_helper'

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'centos', version: '6.9',
                               step_into: ['build_essential']).converge(described_recipe)
  end

  it 'installs the correct packages' do
    expect(chef_run).to install_package(['autoconf', 'bison', 'flex', 'gcc', 'gcc-c++', 'gettext', 'kernel-devel', 'make', 'm4', 'ncurses-devel', 'patch'])
  end

  context 'on rhel < 6' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '5.11',
                                 step_into: ['build_essential']).converge(described_recipe)
    end

    it 'installs more packages' do
      expect(chef_run).to install_package(['gcc44', 'gcc44-c++'])
    end
  end
end
