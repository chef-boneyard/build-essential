require 'spec_helper'

describe 'build-essential::_omnios' do
  context 'omnios 151002' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'omnios', version: '151002')
                            .converge(described_recipe)
    end

    it 'installs the correct packages' do
      expect(chef_run).to install_package('developer/gcc47')
      expect(chef_run).to install_package('developer/object-file')
      expect(chef_run).to install_package('developer/linker')
      expect(chef_run).to install_package('developer/library/lint')
      expect(chef_run).to install_package('developer/build/gnu-make')
      expect(chef_run).to install_package('system/header')
      expect(chef_run).to install_package('system/library/math/header-math')
    end
  end
  context 'omnios 151014' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'omnios', version: '151014')
                            .converge(described_recipe)
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
