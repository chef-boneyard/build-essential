name              'build-essential'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Installs C compiler / build tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '2.3.1'
recipe            'build-essential', 'Installs packages required for compiling C software from source.'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'freebsd'
supports 'mac_os_x', '>= 10.7.0'
supports 'mac_os_x_server', '>= 10.7.0'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'smartos'
supports 'suse'
supports 'ubuntu'
supports 'windows'

suggests 'pkgutil' # Solaris 2

depends '7-zip'

source_url 'https://github.com/chef-cookbooks/build-essential' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/build-essential/issues' if respond_to?(:issues_url)
