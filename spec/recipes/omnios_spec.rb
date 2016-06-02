require 'spec_helper'

describe 'build-essential::default' do
  context 'omnios 151014' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'omnios', version: '151014',
                                 step_into: ['build_essential']).converge(described_recipe)
    end

    it 'installs the correct packages' do
      expect(chef_run).to install_package('developer/gcc48')
      expect(chef_run).to install_package('developer/object-file')
      expect(chef_run).to install_package('developer/linker')
      expect(chef_run).to install_package('developer/library/lint')
      expect(chef_run).to install_package('developer/build/gnu-make')
      expect(chef_run).to install_package('system/header')
      expect(chef_run).to install_package('system/library/math/header-math')
    end
  end
end
