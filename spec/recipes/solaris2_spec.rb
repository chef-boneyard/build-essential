require 'spec_helper'

describe 'build-essential::_solaris2' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'solaris2', version: '5.11')
      .converge(described_recipe)
  end

#  It sounds like you can't test calls to definitions:
#  http://stackoverflow.com/questions/22956998/does-it-make-senses-to-test-a-call-to-a-chef-definition-with-chefspec
#  
#  it 'installs the correct packages' do
#    expect(chef_run).to install_pkgutil_package('autoconf')
#    expect(chef_run).to install_pkgutil_package('automake')
#    expect(chef_run).to install_pkgutil_package('bison')
#    expect(chef_run).to install_pkgutil_package('coreutils')
#    expect(chef_run).to install_pkgutil_package('flex')
#    expect(chef_run).to install_pkgutil_package('gcc4core')
#    expect(chef_run).to install_pkgutil_package('gcc4g++')
#    expect(chef_run).to install_pkgutil_package('gcc4objc')
#    expect(chef_run).to install_pkgutil_package('ggrep')
#    expect(chef_run).to install_pkgutil_package('gmake')
#    expect(chef_run).to install_pkgutil_package('gtar')
#    expect(chef_run).to install_pkgutil_package('pkgconfig')
#  end
end
