#
# Cookbook Name:: build-essential
# Recipe:: rhel
#
# Copyright 2008-2016, Chef Software, Inc.
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

potentially_at_compile_time do
  package 'autoconf'
  package 'bison'
  package 'flex'
  package 'gcc'
  package 'gcc-c++'
  package 'make'
  package 'm4'
  package 'patch'
  package 'gettext-devel'

  execute 'ohai' do
    action :run
  end

  # Ensure kernel-devel is the same as the current kernel version
  # Don't specify a version when on LXC to prevent Travis failures
  package 'kernel-devel' do
    version node['kernel']['release'].sub(".#{node['kernel']['machine']}", '') # unless node['virtualization']['systems']['lxc'] && node['virtualization']['systems']['lxc'] == 'guest'
  end

  # Ensure GCC 4 is available on older pre-6 EL
  if node['platform_version'].to_i < 6
    package 'gcc44'
    package 'gcc44-c++'
  end
end
