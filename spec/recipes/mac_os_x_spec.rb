require 'spec_helper'

describe 'build-essential::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'mac_os_x', version: '10.11.1',
                               step_into: ['build_essential']).converge('build-essential::default')
  end

  it 'installs the xcode command line tools' do
    expect(chef_run).to install_xcode_command_line_tools('install')
  end
end
