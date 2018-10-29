require 'spec_helper'

describe 'build-essential::default' do
  context 'SUSE' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'opensuse', version: '42.3',
                                 step_into: ['build_essential']).converge('build-essential::default')
    end

    it 'installs the correct packages on modern SLES/openSUSE' do
      expect(chef_run).to install_package(['autoconf', 'bison', 'flex', 'gcc', 'gcc-c++', 'kernel-default-devel', 'make', 'm4'])
    end

    context 'on suse < 12' do
      let(:chef_run) do
        ChefSpec::ServerRunner.new(platform: 'suse', version: '11.4',
                                   step_into: ['build_essential']).converge(described_recipe)
      end

      it 'installs more packages' do
        expect(chef_run).to install_package(['gcc48', 'gcc48-c++'])
      end
    end

    context 'on suse >= 15' do
      let(:chef_run) do
        ChefSpec::ServerRunner.new(platform: 'suse', version: '15.0',
                                   step_into: ['build_essential']).converge(described_recipe)
      end

      it 'installs insserv-compat' do
        expect(chef_run).to install_package(['insserv-compat'])
      end
    end
  end
end
