#
# Cookbook Name:: build-essential
# Recipe:: solaris2
#
# Copyright 2013, Chef Software, Inc.
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
  # install omnibus build essential package
  potentially_at_compile_time do
    # create a nocheck file for automated install
    file '/var/sadm/install/admin/auto-install' do
      content <<-EOH.gsub(/^ {8}/, '')
        mail=
        instance=overwrite
        partial=nocheck
        runlevel=nocheck
        idepend=nocheck
        space=ask
        setuid=nocheck
        conflict=nocheck
        action=nocheck
        basedir=default
      EOH
      owner 'root'
      group 'root'
      mode '0444'
    end

    case node['kernel']['machine']
    when 'i86pc'
      package_url = 'https://chef-releng.s3.amazonaws.com/omnibus/build-essential/build-essential-0.0.4-1.i86pc.solaris'
      package_checksum = 'bbee54df52109e1715f7acf4c3779c7a73765b8a8c74f7705f183556d57e6e3a'
    when 'sun4v', 'sun4u'
      package_url = 'https://chef-releng.s3.amazonaws.com/omnibus/build-essential/build-essential-0.0.4-1.sun4v.solaris'
      package_checksum = 'c80a8365541cb713cedf1776ae731168a3f788be6f4ee1c85f7ff9cbfa8c530d'
    end

    package_name = File.basename(package_url)

    remote_file "#{Chef::Config[:file_cache_path]}/#{package_name}" do
      source package_url
      checksum package_checksum
    end

    package 'build-essential' do
      source "#{Chef::Config[:file_cache_path]}/#{package_name}"
      options '-a auto-install'
    end
  end
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
    package 'gnu-tar'
    package 'pkg-config'
    package 'ucb'
  end
else
  raise "Sorry, we don't support Solaris version #{node['platform_version']} at this juncture."
end
