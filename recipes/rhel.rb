#
# Cookbook Name:: build-essential
# Recipe:: rhel
#
# Copyright 2008-2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

pkgs = %w{
  autoconf
  bison
  flex
  gcc
  gcc-c++
  kernel-devel
  make
  m4
}

# ensure GCC 4 is available on older pre-6 EL
if node['platform_version'].to_i < 6
  pkgs.unshift %w{ gcc44 gcc44-c++ }
end

pkgs.flatten.each do |pkg|

  r = package pkg do
    action( node['build_essential']['compiletime'] ? :nothing : :install )
    # TODO: Fix http://tickets.opscode.com/browse/CHEF-4437
    # Chef::Platform os_version attr for RHEL include ARCH which needs to be stripped of for the yum installation to work
    # version( node['os_version'] ) if pkg == 'kernel-devel'
    if pkg == 'kernel-devel'
      chef_platform_os_version = node['os_version'].match /\.el\d$/ ? node['os_version'] : node['os_version'].gsub(/\.[^\.]*$/, '')
      version( chef_platform_os_version.to_s )
    end
  end
  r.run_action(:install) if node['build_essential']['compiletime']

end
