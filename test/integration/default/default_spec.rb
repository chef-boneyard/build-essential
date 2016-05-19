require 'pathname'

# FreeBSD 10+ uses clang
compilers = if (os[:family] == 'freebsd') && (os[:release].to_i == 10)
              %w(cc c++)
            elsif os[:family] == 'windows'
              %w(C:\\msys2\\mingw32\\bin\\gcc C:\\msys2\\mingw32\\bin\\g++)
            else
              %w(gcc g++ cc c++)
            end

compilers.each do |compiler|
  describe command("#{compiler} --version") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }
  end
end

# On FreeBSD `make` is actually BSD make
gmake_bin = if os[:family] == 'freebsd'
              'gmake'
            elsif os[:family] == 'windows'
              'C:\\msys2\\usr\\bin\\make'
            else
              'make'
            end

# Ensure GNU Make exists
describe command("#{gmake_bin} --version") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/GNU/) }
end
