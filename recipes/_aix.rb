#
# Cookbook Name:: build-essential
# Recipe:: aix
#
# Copyright 2015, Chef Software, Inc.
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
  rpm_package 'coreutils' do
    source 'ftp://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc/coreutils/coreutils-8.23-1.aix6.1.ppc.rpm'
  end
  rpm_package 'sudo' do
    source 'ftp://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc/sudo/sudo-1.6.9p23-2noldap.aix5.3.ppc.rpm'
  end
  rpm_package 'wget' do
    source 'ftp://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc/wget/wget-1.9.1-3.aix6.1.ppc.rpm'
  end
  rpm_package 'sudo' do
    source 'ftp://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc/sudo/sudo-1.6.9p23-2noldap.aix5.3.ppc.rpm'
  end
  rpm_package 'make' do
    source 'ftp://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc/make/make-3.81-1.aix6.1.ppc.rpm'
  end
  rpm_package 'patch' do
    source 'ftp://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc/patch/patch-2.5.4-4.aix4.3.ppc.rpm'
end
