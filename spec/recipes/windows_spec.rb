require 'spec_helper'

describe 'build-essential::default' do
  let(:path) { 'C:\\msys2' }
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2',
                               step_into: ['build_essential']) do |node|
      node.set['build-essential']['msys2']['path'] = path
    end.converge(described_recipe)
  end

  it 'creates the correct toolchain dir structure' do
    expect(chef_run).to create_directory(path).with(recursive: true)
  end

  it 'creates binstub for tar' do
    expect(chef_run).to create_file("#{path}\\bin\\tar.bat")
  end

  it 'creates binstub for patch' do
    expect(chef_run).to create_file("#{path}\\bin\\patch.bat")
  end
end
