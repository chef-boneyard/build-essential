require 'serverspec'
require 'pathname'

set :backend, :exec

# Ensure GCC exists
describe command('gcc --version') do
  its(:exit_status) { should eq 0 }
end

# On FreeBSD `make` is actually BSD make
gmake_bin = if os[:family] == 'freebsd'
              'gmake'
            else
              'make'
            end

# Ensure GNU Make exists
describe command("#{gmake_bin} --version") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /GNU/ }
end
