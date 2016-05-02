require 'spec_helper'

describe 'build-essential::_windows' do
  let(:path32) { 'C:\\mingw32' }
  let(:path64) { 'C:\\mingw64' }
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2') do |node|
      node.set['build-essential']['mingw32']['path'] = path32
      node.set['build-essential']['mingw64']['path'] = path64
    end.converge(described_recipe)
  end

  it 'creates the correct toolchain dir structure' do
    expect(chef_run).to create_directory(path32).with(recursive: true)
    expect(chef_run).to create_directory(path64).with(recursive: true)
  end

  it 'copies tar to the right place' do
    expect(chef_run).to create_remote_file("#{path32}\\bin\\tar.exe")
      .with(source: 'file:///C:/mingw32/bin/bsdtar.exe')
    expect(chef_run).to create_remote_file("#{path64}\\bin\\tar.exe")
      .with(source: 'file:///C:/mingw64/bin/bsdtar.exe')
  end
end
