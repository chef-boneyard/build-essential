#
# Cookbook Name:: build-essential
# Recipe:: solaris2
#
# Copyright 2013, Opscode, Inc.
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
  if node['build-essential']['solaris_pkg_source'].eql? 'opencsw'
    install_pkgutil
    pkgutil_install 'autoconf'
    pkgutil_install 'automake'
    pkgutil_install 'bison'
    pkgutil_install 'coreutils'
    pkgutil_install 'flex'
    pkgutil_install 'gcc4core'
    pkgutil_install 'gcc4g++'
    pkgutil_install 'gcc4objc'
    pkgutil_install 'ggrep'
    pkgutil_install 'gmake'
    pkgutil_install 'gtar'
    pkgutil_install 'pkgconfig'
  elsif node['build-essential']['solaris_pkg_source'].eql? 'provided'
    package 'autoconf'
    package 'automake'
    package 'bison'
    package 'coreutils'
    package 'flex'
    package 'gcc4core'
    package 'gcc4g++'
    package 'gcc4objc'
    package 'ggrep'
    package 'gmake'
    package 'gtar'
    package 'pkgconfig'
  else
    Chef::Log.error 'Invalid package source for Solaris system'
  end
end
