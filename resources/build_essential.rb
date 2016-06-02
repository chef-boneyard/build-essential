provides 'build-essential'
provides 'build_essential'

property :compile_time, [true, false], default: false

action :install do
  case node['platform_family']
  when 'debian'
    package %w( autoconf binutils-doc bison build-essential flex gettext ncurses-dev )
  when 'fedora', 'rhel'
    package %w( autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 ncurses-devel patch )

    # Ensure GCC 4 is available on older pre-6 EL
    package %w( gcc44 gcc44-c++ ) if node['platform_version'].to_i < 6
  when 'freebsd'
    package 'devel/gmake'
    package 'devel/autoconf'
    package 'devel/m4'
    package 'devel/gettext'
    # Only install gcc on freebsd 9.x - 10 uses clang
    package 'lang/gcc49' if node['platform_version'].to_i <= 9
  when 'mac_os_x'
    xcode_command_line_tools 'install'
  when 'omnios'
    package 'developer/gcc48'
    package 'developer/object-file'
    package 'developer/linker'
    package 'developer/library/lint'
    package 'developer/build/gnu-make'
    package 'system/header'
    package 'system/library/math/header-math'

    # Per OmniOS documentation, the gcc bin dir isn't in the default
    # $PATH, so add it to the running process environment
    # http://omnios.omniti.com/wiki.php/DevEnv
    ENV['PATH'] = "#{ENV['PATH']}:/opt/gcc-4.7.2/bin"
  when 'solaris2'
    package 'autoconf'
    package 'automake'
    package 'bison'
    package 'gnu-coreutils'
    package 'flex'
    package 'gcc'
    package 'gcc-3'
    package 'gnu-grep'
    package 'gnu-make'
    package 'gnu-patch'
    package 'gnu-tar'
    package 'pkg-config'
    package 'ucb'
  when 'smartos'
    package 'autoconf'
    package 'binutils'
    package 'build-essential'
    package 'gcc47'
    package 'gmake'
    package 'pkg-config'
  when 'suse'
    package %w( autoconf bison flex gcc gcc-c++ kernel-default-devel make m4 )
  when 'windows'
    include_recipe 'build_essential::_windows'
  else
    Chef::Log.warn <<-EOH
  A build-essential recipe does not exist for '#{node['platform_family']}'. This
  means the build-essential cookbook does not have support for the
  #{node['platform_family']} family. If you are not compiling gems with native
  extensions or building packages from source, this will likely not affect you.
  EOH
  end
end

# this resource forces itself to run at compile_time
def after_created
  if compile_time
    Array(action).each do |action|
      run_action(action)
    end
  end
end
