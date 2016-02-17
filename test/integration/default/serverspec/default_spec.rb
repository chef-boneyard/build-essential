require 'serverspec'
require 'pathname'

if RUBY_PLATFORM =~ /mingw/
  set :backend, :cmd
  set :os, family: 'windows'
  ENV['PATH'] = 'C:\\msys\\bin;C:\\msys\\mingw\\bin'
else
  set :backend, :exec
end

# FreeBSD 10+ uses clang
compilers = if (os[:family] == 'freebsd') && (os[:release] == 10)
              %w(cc c++)
            elsif os[:family] == 'windows'
              %w(gcc g++)
            else
              %w(gcc g++ cc c++)
            end

compilers.each do |compiler|
  describe command("#{compiler} --version") do
    its(:exit_status) { should eq 0 }
  end
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
  its(:stdout) { should match(/GNU/) }
end
