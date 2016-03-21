#
# Cookbook Name:: build-essential
# Recipe:: solaris2
#
# Copyright 2013-2016, Chef Software, Inc.
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

case node['platform_version'].to_f
when 5.10
  Chef::Log.warn('build-essential does not support Solaris 10. You will need to install SUNWbison, SUNWgcc, SUNWggrp, SUNWgmake, and SUNWgtar from the Solaris DVD')
when 5.11
  potentially_at_compile_time do
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
  end
else
  raise "Sorry, we don't support Solaris version #{node['platform_version']} at this juncture."
end
